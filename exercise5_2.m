% ���������
n=5;
% ���ɶԳ�����ϵ������A.
Q=orth(randn(n));
D=diag(randn(n, 1));
A=Q'*B*Q;
% �Ҷ�����b.
b=randn(n, 1);
disp('A=');
disp(A);
disp('b=');
disp(b);
disp('x=');
% ʹ�øĽ�ƽ�����㷨��Ⲣ��ӡ�����
disp(square_root_improve(A, b));
