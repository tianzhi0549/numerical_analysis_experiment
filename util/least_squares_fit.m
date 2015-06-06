function coeffs = least_squares_fit(x, y, n)
%对x, y点集使用正交多项式，在最小二乘法的条件下做拟合。
%   n拟合结果的最高次数。
%   返回值： coeffs, 拟合出来的多项式的系数。
    a=zeros(n+1, 1);
    [ORTHOGONAL_POLY_MAT, Y]=compute_orthogonal_poly(x, n);
    for i=1:n+1
        a(i)=inner_product(y, Y(:, i))/inner_product(Y(:, i), Y(:, i));
    end
    % 拼凑最终的多项式。
    syms x S;
    P=sym('x', [n+1 1]);
    P(1)=1;
    S=sym(a(1));
    if n~=0
        P(2)=(x-ORTHOGONAL_POLY_MAT(1, 2));
        S=S+a(2)*P(2);
        for i=3:n+1
            P(i)=(x-ORTHOGONAL_POLY_MAT(1, i))*P(i-1)-...
                ORTHOGONAL_POLY_MAT(2, i)*P(i-2);
            S=S+a(i)*P(i);
        end
    end
    coeffs=sym2poly(S);
end
function [ORTHOGONAL_POLY_MAT, Y]=compute_orthogonal_poly(x, n)
% 计算正交多项式矩阵。每列是一个正交多项式。
% 每个正交多项式由两个参数决定。
% $P_{k+1}(x)=(x-\alpha})*P_{k}+\beta*P_{k-1}$.
% 所以这个矩阵的每一列的两个数字就依次是alpha, beta.
% 对于P_{1}来说，beta始终是0.
% 对于P_{0}来说，alpha, beta都是0. P_{0}=1.
% 计算alpha, beta的方式见课本P77 4.10.
% Y每一个多项式在x处的值。
    ORTHOGONAL_POLY_MAT=zeros(2, n+1);
    % Y的第k列是P_k(x)的值。
    Y=zeros(length(x), n+1);
    %计算P_0的Y向量。
    Y(:, 1)=1;
    % 计算P1的系数。
    alpha=sum(x.*Y(:, 1).^2)/sum(Y(:, 1).^2);
    ORTHOGONAL_POLY_MAT(1, 2)=alpha;
    if n==0
        return;
    end
    % 计算P_1的Y向量。
    Y(:, 2)=orthogonal_poly_val(ORTHOGONAL_POLY_MAT(:, 2), x, Y(:, 1));
    for i=3:n+1
        alpha=inner_product(x, Y(:, i-1).^2)/inner_product(Y(:, i-1), Y(:, i-1));
        beta=inner_product(Y(:, i-1), Y(:, i-1))/inner_product(Y(:, i-2), Y(:, i-2));
        ORTHOGONAL_POLY_MAT(1, i)=alpha;
        ORTHOGONAL_POLY_MAT(2, i)=beta;
        Y(:, i)=orthogonal_poly_val(ORTHOGONAL_POLY_MAT(:, i), x, Y(:, i-1), Y(:, i-2));
    end
end
function val=orthogonal_poly_val(poly, x, last_y, y_before_last)
% 计算一个如compute_orthogonal_poly中定义的多项式在x处的值。 
% last_y上一个多项式在x处的值。
% y_before_last 上上一个多项式在x处的值。
    if nargin()==2
        val=x;
        val(:, :)=1;
    elseif nargin()==3
        val=(x-poly(1)).*last_y;
    else
        val=(x-poly(1)).*last_y-poly(2).*y_before_last;
    end
end
function p=inner_product(a, b)
    p=a'*b;
end
