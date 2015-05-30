% 对输入点进行拉格朗日插值
% X -已知点的x坐标。
% Y -已知点的y坐标。
% x -需要通过插值计算y的x的值。
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
