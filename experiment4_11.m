% % % ��ͼ
% % 
% % % ����Ҷõ����
% subplot(221);
% theta=linspace(0, pi, 50);
% r=@(theta)(3*sin(3*theta));
% animate(theta, r(theta), 25);
% title('��Ҷõ����');
% ����Ҷõ����
% subplot(222);
% theta=linspace(0, 2*pi, 50);
% r=@(theta)(4*cos(2*theta));
% animate(theta, r(theta), 25);
% title('��Ҷõ����');
% ��Ҷõ����
% subplot(223);
% theta=linspace(pi/6, pi/2, 100);
% r=@(theta)(2*cos(3*theta).^2);
% animate(theta, r(theta), 25);
% title('��Ҷõ����');
% ˫Ŧ��
% subplot(224);
% theta=linspace(-pi/4, pi/4, 50);
% r=@(theta)(2*cos(2*theta).^(1/2));
% animate([theta theta], [r(theta) -r(theta)], 25);
% title('˫Ŧ��');
% % �ѿ���Ҷ���ߡ�
figure(2);
t=0:0.01:1/2^(1/3);
x=@(t)(3*2*t./(1+t.^3));
y=@(t)(3*2*t.^2./(1+t.^3));
plot(x(t), y(t));
hold on;
t=1/2^(1/3);
plot(x(t), y(t), 'ro');
