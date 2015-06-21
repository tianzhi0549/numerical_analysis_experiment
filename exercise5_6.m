% ��1�ʡ�
% �����з����������ĺ�����util/col_cond.m.
% �ڶ��ʡ�
N=1:30;
conds=zeros(1, 30);
for n=N
    A=hilb(n)+eye(n)*0.5;
    conds(n)=col_cond(A);
end
cla;
plot(N, conds, 'ro');
hold on;
% ��С������ϡ�
poly=least_squares_fit(N', conds', 4);
% ������Ͻ����
x=0:30;
plot(x, polyval(poly, x));
% ��������Կ���4�ζ���ʽ��ϵĽ���Ѿ��ܺ��ˡ�
% ��������ߴ������ָߴ��ݵ�ϵ��Ϊ0.
% ����n��A���з���������֮��Ĺ�ϵΪһ��4�ζ���ʽ��
% ����ʽϵ�����£�
disp('n��A���з����������Ĺ�ϵΪ4�ζ���ʽ������ʽϵ�����£�');
disp(poly');

% �����ʣ�
for n=5:5:20
    A=hilb(n)+eye(n)*0.5;
    if(~is_positive_definite(A))
        continue;
    end
    x=ones(n, 1);
    b=A*x;
    fprintf('n=%dʱ��\n', n);
    fprintf('\t�Ľ���ƽ�����������������%e.\n' ,norm(square_root_improve(A, b)-x, 'inf'));
    fprintf('\t����Ԫ��˹��ȥ�������������%e.\n', norm(gausspiv(A, b)-x, 'inf'));
end
