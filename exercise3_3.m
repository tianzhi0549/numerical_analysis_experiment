% ʹ��legendre����ʽ�ƽ�sin(pi*x/2).
coffs=best_squar_poly_approx(@(x)sin(pi/2*x), 3, 'legendre', ...
    true, '3�ζ���ʽ�ƽ�sin(\pix/2)');
disp('ʹ��3��legendre����ʽ�ƽ�sin(pi*x/2)�ĸ���ϵ�����ӵ͵��ߣ�');
disp(coffs);
coffs=best_squar_poly_approx(@(x)sin(pi/2*x), 5, 'legendre', ...
    true, '5�ζ���ʽ�ƽ�sin(\pix/2)');
disp('ʹ��5��legendre����ʽ�ƽ�sin(pi*x/2)�ĸ���ϵ�����ӵ͵��ߣ�');
disp(coffs);
