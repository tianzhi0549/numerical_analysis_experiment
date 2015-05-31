% �����������������ղ�ֵ
% X -��֪���x���ꡣ
% Y -��֪���y���ꡣ
% x -��Ҫͨ����ֵ����y��x��ֵ��
function interp_y= lagrange_interp(X, Y, interp_x)
    interp_y=zeros(1, size(interp_x, 2));
    points_count=size(X, 2);
    coefficients=ones(1, points_count);
        for k=1:points_count
            % �����k����������ϵ����
            for i=1:points_count
                if i~=k
                    coefficients(k)=coefficients(k)*(X(k)-X(i));
                end
            end
            coefficients(k)=Y(k)/coefficients(k);
            % ����ÿ����ֵ���y���ϵ�k����������ֵ��
            for index_interp=1:size(interp_x, 2)
                l=1;
                for i=1:points_count
                    if i~=k
                        l=l*(interp_x(index_interp)-X(i));
                    end
                end
                interp_y(index_interp)=interp_y(index_interp)+coefficients(k)*l;
            end
        end
end
