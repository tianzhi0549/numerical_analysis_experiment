% ���������
n=5;
% ����ϵ������A.
A=gen_rnd_tridiagonal_mat(n);
% �����Ҷ�����b.
b=randn(n, 1);
disp('A=');
disp(A);
disp('b=');
disp(b);
disp('x=');
% ʹ�á�׷�Ϸ�����Ⲣ��ӡ�����
disp(thomas_algorithm(M, b));
