function x = square_root_improve(A, b)
% 改进的平方根算法解线性方程组。
% A 对称系数矩阵。
% b 右端列向量。
% T, L, d 与课本上的一致。
    n=length(A);
    d=zeros(n, 1);
    T=zeros(n);
    L=eye(n);
    d(1)=A(1, 1);
    for i=2:n
        for j=1:i-1
            s=0;
            for k=1:j-1
                s=s+T(i, k)*L(j, k);
            end
            T(i, j)=A(i, j)-s;
        end
        for j=1:i-1
            L(i, j)=T(i, j)/d(j);
        end
        s=0;
        for k=1:i-1
            s=s+T(i, k)*L(i, k);
        end
        d(i)=A(i, i)-s;
    end
    y=zeros(n, 1);
    for i=1:n
        s=0;
        for k=1:i-1
            s=s+L(i, k)*y(k);
        end
        y(i)=b(i)-s;
    end
    x=zeros(n,1);
    for i=n:-1:1
        s=0;
        for k=i+1:n
            s=s+L(k, i)*x(k);
        end
        x(i)=y(i)/d(i)-s;
    end
end
