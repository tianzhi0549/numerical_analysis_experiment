% % ��ͼ
% 
% % ����Ҷõ����
subplot(221);
theta=linspace(0, pi, 50);
r=3*sin(3*theta);
animate(theta, r, 25);
title('��Ҷõ����');
% ����Ҷõ����
subplot(222);
theta=linspace(0, 2*pi, 50);
r=4*cos(2*theta);
animate(theta, r, 25);
title('��Ҷõ����');
% ��Ҷõ����
subplot(223);
theta=linspace(0, 2*pi, 100);
r=2*cos(3*theta).^2;
animate(theta, r, 25);
title('��Ҷõ����');
% ˫Ŧ��
subplot(224);
theta=linspace(-pi/4, pi/4, 50);
r=2*cos(2*theta).^(1/2);
animate([theta theta], [r -r], 25);
title('˫Ŧ��');
