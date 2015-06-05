% 求f的多项式逼近。
% f 要逼近的一元函数。
% order 逼近多项式的阶数。
% type 使用的多项式类型。
%   simple 使用1, x, x^2....x^n这组多项式，逼近区间为[0, 1].
%   legendre 使用勒让德多项式逼近，逼近区间为[-1, 1].
% 返回值，每个基的系数。
function coefficients=best_squar_poly_approx(f, order, type, is_plot, caption)
    d=zeros(order+1, 1);
    if strcmp(type, 'simple')
        H=hilb(order+1);
    elseif strcmp(type, 'legendre')
        H=diag(2./(1:2:2*order+1));
    else
        error('无法识别的多项式类型。');
    end
    for i=1:order+1
        if strcmp(type, 'simple')
            fun=@(x)(f(x).*x.^(i-1));
            d(i)=quad(fun, 0, 1);
        elseif strcmp(type, 'legendre')
            fun=@(x)(f(x).*legendreP(i-1, x));
            d(i)=quad(fun, -1, 1);
        end
    end
    coefficients=H\d;
    if is_plot
        figure();
        if nargin()==5
            title(caption);
        end
        hold on;
        if strcmp(type, 'simple')
            x=0:0.1:1;
            plot(x, f(x));
            plot(x, polyval(fliplr(coefficients), x), 'r--');
        elseif strcmp(type, 'legendre')
            x=-1:0.1:1;
            plot(x, f(x));
            plot(x, legendre_sum(coefficients, x), 'r--');
        end
        legend('原函数', '逼近结果');
    end
end
function sum=legendre_sum(coefficients, x)
    sum=zeros(1, length(x));
    n=length(coefficients);
    for i=0:n-1
        sum=coefficients(i+1)*legendreP(i, x)+sum;
    end
end
