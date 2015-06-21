% 矩阵阶数。
n=5;
% 生成对称正定系数矩阵A.
Q=orth(randn(n));
D=diag(randn(n, 1));
A=Q'*B*Q;
% 右端向量b.
b=randn(n, 1);
disp('A=');
disp(A);
disp('b=');
disp(b);
disp('x=');
% 使用改进平方根算法求解并打印结果。
disp(square_root_improve(A, b));
