function r=is_positive_definite(A)
    if A==(A')
        [R, p]=chol(A);
        if p==0
            r=true;
            return;
        end
    end
    r=false;
end
