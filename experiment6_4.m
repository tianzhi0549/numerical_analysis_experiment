for n=[40 80 200 500 1000]
    A=hilb(n); % ����A.
    x=ones(n, 1); % ����x.
    b=A*x; % ����b.
    [x_, e, iter_count]=cg(A, b); % ��ⷽ�̡�
    fprintf('n=%d.\niter_count=%d.\ne_max=%e.\n\n', n, iter_count, norm(x_-x, inf));
end
