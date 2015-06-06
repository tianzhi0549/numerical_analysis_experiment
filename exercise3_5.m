cla;
hold on;

x=[0.0 0.1 0.2 0.3 0.5 0.8 1.0]';
y=[1.0 0.41 0.50 0.61 0.91 2.02 2.46]';
x1=0:0.01:1;

plot(x, y, 'ro');

poly=least_squares_fit(x, y, 3);
disp('三次拟合多项式为:');
disp(vpa(poly2sym(poly), 6));

plot(x1, polyval(poly, x1), 'b-');

poly=least_squares_fit(x, y, 4);

disp('四次拟合多项式为:');
disp(vpa(poly2sym(poly), 6));

plot(x1, polyval(poly, x1), 'k--');
legend('原始点集', '三次多项式拟合', '四次多项式拟合', 'location', 'southeast');
