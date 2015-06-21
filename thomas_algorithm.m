function x=thomas_algorithm(A, b)
% ��׷�Ϸ������Խ��ϸ�ռ�����ԽǾ���
    n=length(A);
    beta=zeros(n-1, 1);
    beta(1)=A(1, 2)/A(1, 1);
	for i=2:n-1
        beta(i)=A(i-1, i)/(A(i, i)-A(i, i-1)*beta(i-1));
    end
    y=zeros(n, 1);
    y(1)=b(1)/A(1, 1);
    for i=2:n
        y(i)=(b(i)-A(i, i-1)*y(i-1))/(A(i, i)-A(i, i-1)*beta(i-1));
    end
    x=zeros(n, 1);
    x(n)=y(n);
    for i=n-1:-1:1
        x(i)=y(i)-beta(i)*x(i+1);
    end
end
