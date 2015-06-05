% 使用legendre多项式逼近sin(pi*x/2).
coffs=best_squar_poly_approx(@(x)sin(pi/2*x), 3, 'legendre', ...
    true, '3次多项式逼近sin(\pix/2)');
disp('使用3次legendre多项式逼近sin(pi*x/2)的各项系数，从低到高：');
disp(coffs);
coffs=best_squar_poly_approx(@(x)sin(pi/2*x), 5, 'legendre', ...
    true, '5次多项式逼近sin(\pix/2)');
disp('使用5次legendre多项式逼近sin(pi*x/2)的各项系数，从低到高：');
disp(coffs);
