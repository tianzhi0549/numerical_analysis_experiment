function cond=col_cond(A)
    cond=col_norm(A)*col_norm(inv(A));
end
function norm = col_norm(A)
% 求矩阵的列范数。
    s=zeros(size(A, 2), 1);
    for col=1:size(A, 2)
        for row=1:size(A, 1)
            s(col)=s(col)+abs(A(row, col));
        end
    end
    norm=max(s);
end
