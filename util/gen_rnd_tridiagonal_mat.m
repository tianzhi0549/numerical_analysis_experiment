function  M=gen_rnd_tridiagonal_mat(n)
    M=randn(n);
    for i=1:n
        s=0;
        for j=1:n
            if abs(i-j)>1
                M(i, j)=0;
            end
            if i~=j
                s=s+abs(M(i, j));
            end
        end
        if M(i, i)>=0
            M(i, i)=M(i, i)+s;
        else
            M(i, i)=M(i, i)-s;
        end
    end
end
