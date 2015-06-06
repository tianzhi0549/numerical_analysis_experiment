cla;
hold on;
% ��ԭ������
x=0:0.1:1;
plot(x, exp(x), 'b-');
% ��һ�ʡ�
disp('ʹ��1, x, x^2, x^3, x^4�ƽ�exp(x).');
coffs=best_squar_poly_approx(@exp, 4, 'simple', false);
disp('����ϵ��(�͵���)��');
disp(coffs);

% ��ͼ��
plot(x, polyval(coffs, x), 'k--');

% �ڶ��ʡ�
disp('ʹ��legendre����ʽ�ƽ�exp(x).');
% ��Ϊbest_squar_poly_approx����legendre����ʽ�ƽ�ֻ����[-1, 1]�ϣ�
% ���Դ˴���t���˴�����
coffs=best_squar_poly_approx(@(t)exp(t/2+0.5), 4, 'legendre', false);
disp('����ϵ��(�͵���)��');
disp(coffs);
t=2*x-1;
plot(x, legendre_sum(coffs, t), 'r-.');

% �����ʣ� ǰ���ʵ�ͼ�Ѿ����ˡ�������̩��չ����
syms t;
f=taylor(exp(t),'Order', 5, 'ExpansionPoint', 0);
disp('̩��չ��Ϊ��');
disp(subs(f, t, 'x'));
% ��ͼ��
plot(x, subs(f, t, x), 'c:');

legend('ԭ����', 'ʹ��1...x^4�ƽ�', 'Legendre�ƽ�', '̩��չ��');
% ���ۣ�
% ��ȻLegendre�ƽ���Ч��Զ����ʹ��1...x^4�ƽ���
% 1...x^4Ч�����ԭ����Ҫ����Ϊϣ�����ؾ���߶Ȳ�̬����ľ��Ⱥܵ͡�
