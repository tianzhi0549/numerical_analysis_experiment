x1=-1:0.1:1;
x2=x1(1:2:size(x1, 2));
plot(x1, 1./(1+25*x1.^2));
hold on;
plot(x1, lagrange_interp(x2, 1./(1+25*x2.^2), x1), 'r');
