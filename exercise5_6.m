% 第1问。
% 计算列范数条件数的函数见util/col_cond.m.
% 第二问。
N=1:30;
conds=zeros(1, 30);
for n=N
    A=hilb(n)+eye(n)*0.5;
    conds(n)=col_cond(A);
end
cla;
plot(N, conds, 'ro');
hold on;
% 最小二乘拟合。
poly=least_squares_fit(N', conds', 4);
% 绘制拟合结果。
x=0:30;
plot(x, polyval(poly, x));
% 从上面可以看出4次多项式拟合的结果已经很好了。
% 而且再提高次数发现高次幂的系数为0.
% 所以n与A的列范数条件数之间的关系为一个4次多项式。
% 多项式系数如下：
disp('n与A的列范数条件数的关系为4次多项式，多项式系数如下：');
disp(poly');

% 第三问：
for n=5:5:20
    A=hilb(n)+eye(n)*0.5;
    if(~is_positive_definite(A))
        continue;
    end
    x=ones(n, 1);
    b=A*x;
    fprintf('n=%d时：\n', n);
    fprintf('\t改进的平方根法误差的无穷范数：%e.\n' ,norm(square_root_improve(A, b)-x, 'inf'));
    fprintf('\t列主元高斯消去法误差的无穷范数：%e.\n', norm(gausspiv(A, b)-x, 'inf'));
end
