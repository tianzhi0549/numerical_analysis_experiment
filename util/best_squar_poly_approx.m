% ��f�Ķ���ʽ�ƽ���
% f Ҫ�ƽ���һԪ������
% order �ƽ�����ʽ�Ľ�����
% type ʹ�õĶ���ʽ���͡�
%   simple ʹ��1, x, x^2....x^n�������ʽ���ƽ�����Ϊ[0, 1].
%   legendre ʹ�����õ¶���ʽ�ƽ����ƽ�����Ϊ[-1, 1].
% ����ֵ��coefficients ÿ����������ϵ����
function coefficients=best_squar_poly_approx(f, order, type, is_plot, caption)
    d=zeros(order+1, 1);
    if strcmp(type, 'simple')
        H=hilb(order+1);
    elseif strcmp(type, 'legendre')
        H=diag(2./(1:2:2*order+1));
    else
        error('�޷�ʶ��Ķ���ʽ���͡�');
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
        legend('ԭ����', '�ƽ����');
    end
end

