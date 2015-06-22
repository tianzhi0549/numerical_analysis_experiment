for n=[40 80 200 500 1000]
    A=hilb(n); % 生成A.
    x=ones(n, 1); % 生成x.
    b=A*x; % 计算b.
    [x_, e, iter_count]=cg(A, b); % 求解方程。
    fprintf('n=%d.\niter_count=%d.\ne_max=%e.\n\n', n, iter_count, norm(x_-x, inf));
end
