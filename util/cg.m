function [x, e, iter_count]=cg(A, b, eps)
    if nargin()<3
        eps=1E-6;
    end
    n=length(A);
    x=zeros(n, 1);
    r=b-A*x;
    p=r;
    iter_count=0;
    e=(r'*r)^(1/2);
    while e>eps
        iter_count=iter_count+1;
        a=(r'*r)/(p'*A*p);
        x=x+a*p;
        last_r=r;
        r=r-a*A*p;
        beta=(r'*r)/(last_r'*last_r);
        p=r+beta*p;
        e=(r'*r)^(1/2);
    end
end
