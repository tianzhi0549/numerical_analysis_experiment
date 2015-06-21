function x=gausspiv(A, b)
    % 使用选主元高斯消去法计算Ax=b的解。
    n=length(A);
    for k=1:n-1
        index=select_max_abs_index(A(k:end, k));
        index=index+k-1;
        if index~=k
            A=swap_row(A, index, k);
            swap_row(b, index, k);
        end
        for i=k+1:n
            m=A(i, k)/A(k, k);
            A(i, k)=m;
            for j=k+1:n
                A(i, j)=A(i, j)-m*A(k, j);
            end
            b(i)=b(i)-m*b(k);
        end
    end
    if A(n, n)~=0
        b(n)=b(n)/A(n, n);
        for i=n-1:-1:1
            s=0;
            for j=i+1:n
                s=s+A(i, j)*b(j);
            end
            b(i)=(b(i)-s)/A(i, i);
        end
        x=b;
    else
        error('系数矩阵的行列式等于0.');
    end
end
function max=select_max_abs_index(v)
    max=1;
    for i=2:length(v)
        if abs(v(i))>abs(v(max))
            max=i;
        end
    end
end
function R=swap_row(A, i, j)
    R=A;
    R(i, :)=A(j, :);
    R(j, :)=A(i, :);
end
