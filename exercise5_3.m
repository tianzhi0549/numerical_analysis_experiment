% 矩阵阶数。
n=5;
% 生成系数矩阵A.
A=gen_rnd_tridiagonal_mat(n);
% 生成右端向量b.
b=randn(n, 1);
disp('A=');
disp(A);
disp('b=');
disp(b);
disp('x=');
% 使用“追赶法”求解并打印结果。
disp(thomas_algorithm(M, b));
