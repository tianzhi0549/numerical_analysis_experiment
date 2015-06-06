cla;
hold on;
% 画原函数。
x=0:0.1:1;
plot(x, exp(x), 'b-');
% 第一问。
disp('使用1, x, x^2, x^3, x^4逼近exp(x).');
coffs=best_squar_poly_approx(@exp, 4, 'simple', false);
disp('各项系数(低到高)：');
disp(coffs);

% 画图。
plot(x, polyval(coffs, x), 'k--');

% 第二问。
disp('使用legendre多项式逼近exp(x).');
% 因为best_squar_poly_approx对于legendre多项式逼近只能求[-1, 1]上，
% 所以此处用t做了代换。
coffs=best_squar_poly_approx(@(t)exp(t/2+0.5), 4, 'legendre', false);
disp('各项系数(低到高)：');
disp(coffs);
t=2*x-1;
plot(x, legendre_sum(coffs, t), 'r-.');

% 第三问， 前两问的图已经画了。下面是泰勒展开。
syms t;
f=taylor(exp(t),'Order', 5, 'ExpansionPoint', 0);
disp('泰勒展开为：');
disp(subs(f, t, 'x'));
% 画图。
plot(x, subs(f, t, x), 'c:');

legend('原函数', '使用1...x^4逼近', 'Legendre逼近', '泰勒展开');
% 结论：
% 显然Legendre逼近的效果远好于使用1...x^4逼近。
% 1...x^4效果差的原因主要是因为希尔伯特矩阵高度病态。解的精度很低。
