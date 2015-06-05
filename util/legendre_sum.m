function sum=legendre_sum(coefficients, x)
    sum=zeros(1, length(x));
    n=length(coefficients);
    for i=0:n-1
        sum=coefficients(i+1)*legendreP(i, x)+sum;
    end
end
