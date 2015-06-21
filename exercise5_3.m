n=5;
M=gen_rnd_tridiagonal_mat(n);
b=randn(n, 1);
disp('M=');
disp(M);
disp('b=');
disp(b);
disp('x=');
disp(thomas_algorithm(M, b));
