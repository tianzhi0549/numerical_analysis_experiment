function x=thomas_algorithm(A, f)
% “追赶法”求解对角严格占优三对角矩阵。
    function v=b(i)
        v=A(i, i);
    end
    function v=c(i)
        v=A(i, i+1);
    end
    function v=a(i)
        v=A(i, i-1);
    end

    n=length(A);
    beta=zeros(n-1, 1);
    beta(1)=c(1)/b(1);
    for i=2:n-1
        beta(i)=c(i)/(b(i)-a(i)*beta(i-1));
    end
    y=zeros(n, 1);
    y(1)=f(1)/b(1);
    for i=2:n
        y(i)=(f(i)-a(i)*y(i-1))/(b(i)-a(i)*beta(i-1));
    end
    x=zeros(n, 1);
    x(n)=y(n);
    for i=n-1:-1:1
        x(i)=y(i)-beta(i)*x(i+1);
    end
end
