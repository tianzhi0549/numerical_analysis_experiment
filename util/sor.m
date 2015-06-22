function [x, e, iter_count] = sor(A, b, omega, eps, max_iteration)
    % sor����ʵ�֡�
    % A ϵ������
    % b �Ҷ�������
    % omega �ɳ����ӡ�
    % eps ��������
    % max_iteration ������������
    % ����ֵ:
    % x �⡣
    % e ������
    % iter_count ʵ�ʵ���������
    if nargin()<3
        omega=1;
    end
    if nargin()<4
        eps=1E-6;
    end
    if nargin()<5
        max_iteration=inf;
    end
    n=length(A);
    iter_count=0;
    x=zeros(n, 1);
    e=eps+1;
    while iter_count<max_iteration && e>eps
        iter_count=iter_count+1;
        last_x=x;
        for i=1:n
            x(i)=x(i)+omega*(b(i)-sum(A(i, :)'.*x))/A(i, i);
        end
        e=norm((last_x-x), inf);
    end
end
