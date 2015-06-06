function coeffs = least_squares_fit(x, y, n)
%��x, y�㼯ʹ����������ʽ������С���˷�������������ϡ�
%   n��Ͻ������ߴ�����
%   ����ֵ�� coeffs, ��ϳ����Ķ���ʽ��ϵ����
    a=zeros(n+1, 1);
    [ORTHOGONAL_POLY_MAT, Y]=compute_orthogonal_poly(x, n);
    for i=1:n+1
        a(i)=inner_product(y, Y(:, i))/inner_product(Y(:, i), Y(:, i));
    end
    % ƴ�����յĶ���ʽ��
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
% ������������ʽ����ÿ����һ����������ʽ��
% ÿ����������ʽ����������������
% $P_{k+1}(x)=(x-\alpha})*P_{k}+\beta*P_{k-1}$.
% ������������ÿһ�е��������־�������alpha, beta.
% ����P_{1}��˵��betaʼ����0.
% ����P_{0}��˵��alpha, beta����0. P_{0}=1.
% ����alpha, beta�ķ�ʽ���α�P77 4.10.
% Yÿһ������ʽ��x����ֵ��
    ORTHOGONAL_POLY_MAT=zeros(2, n+1);
    % Y�ĵ�k����P_k(x)��ֵ��
    Y=zeros(length(x), n+1);
    %����P_0��Y������
    Y(:, 1)=1;
    % ����P1��ϵ����
    alpha=sum(x.*Y(:, 1).^2)/sum(Y(:, 1).^2);
    ORTHOGONAL_POLY_MAT(1, 2)=alpha;
    if n==0
        return;
    end
    % ����P_1��Y������
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
% ����һ����compute_orthogonal_poly�ж���Ķ���ʽ��x����ֵ�� 
% last_y��һ������ʽ��x����ֵ��
% y_before_last ����һ������ʽ��x����ֵ��
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
