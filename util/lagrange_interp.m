% �����������������ղ�ֵ
% X -��֪���x���ꡣ
% Y -��֪���y���ꡣ
% x -��Ҫͨ����ֵ����y��x��ֵ��
function y = lagrange_interp(X, Y, x)
    y=0;
    points_count=size(X, 2);
    for k=1:points_count
        l=1;
        for i=1:points_count
            if i~=k
                l=l*(x-X(i))/(X(k)-X(i));
            end
        end
        y=y+Y(k)*l;
    end
end
