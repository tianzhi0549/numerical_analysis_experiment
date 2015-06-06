cla;
hold on;

x=[0.0 0.1 0.2 0.3 0.5 0.8 1.0]';
y=[1.0 0.41 0.50 0.61 0.91 2.02 2.46]';
x1=0:0.01:1;

plot(x, y, 'ro');

poly=least_squares_fit(x, y, 3);
disp('������϶���ʽΪ:');
disp(vpa(poly2sym(poly), 6));

plot(x1, polyval(poly, x1), 'b-');

poly=least_squares_fit(x, y, 4);

disp('�Ĵ���϶���ʽΪ:');
disp(vpa(poly2sym(poly), 6));

plot(x1, polyval(poly, x1), 'k--');
legend('ԭʼ�㼯', '���ζ���ʽ���', '�Ĵζ���ʽ���', 'location', 'southeast');
