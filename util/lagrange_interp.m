% 对输入点进行拉格朗日插值
% X -已知点的x坐标。
% Y -已知点的y坐标。
% x -需要通过插值计算y的x的值。
function interp_y= lagrange_interp(X, Y, interp_x)
    interp_y=zeros(1, size(interp_x, 2));
    points_count=size(X, 2);
    coefficients=ones(1, points_count);
        for k=1:points_count
            % 计算第k个基函数的系数。
            for i=1:points_count
                if i~=k
                    coefficients(k)=coefficients(k)*(X(k)-X(i));
                end
            end
            coefficients(k)=Y(k)/coefficients(k);
            % 计算每个插值点的y加上第k个基函数的值。
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
