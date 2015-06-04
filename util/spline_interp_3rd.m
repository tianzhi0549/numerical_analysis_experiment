function [coefficients, regions] = spline_interp_3rd(X, Y, cnd_type, l, r, plot)
    % 3次样条插值
    % X 已知点的X的值。
    % Y 已知点的Y的值。
    % cnd_type 1-固支边界条件，2-自然边界条件。
    % coefficients 三次多项式的4个系数，由高到底。
    % regions 每个系数生效的区间。
    points_count=size(X, 2);
    coefficients =zeros(4, points_count-1);
    regions=zeros(2, points_count-1);
    if points_count<2
        error('至少需要输入两个点。');
    end
    % 计算h.
    h=zeros(points_count-1, 1);
    for i=1:points_count-1
        h(i)=X(i+1)-X(i);
    end
    
    % 计算u.
    u=zeros(points_count-2, 1);
    for i=1:points_count-2
        u(i)=h(i)/(h(i)+h(i+1));
    end
    
    % 计算d.
    d=zeros(points_count, 1);
    for i=2:points_count-1
        d(i)=6*divdiff([X(i-1) X(i) X(i+1)], [Y(i-1) Y(i) Y(i+1)]);
    end
    % 生成线性方程组的系数矩阵A.
    A=eye(points_count)*2;
    if cnd_type==1
        d(1)=6/h(1)*(divdiff([X(1) X(2)], [Y(1) Y(2)])-l);
        d(end)=6/h(end)*(r-divdiff([X(end-1) X(end)], [Y(end-1) Y(end)]));
        A(end, end-1)=1;
        A(1, 2)=1;
    elseif cnd_type==2
        d(1)=2*l;
        d(end)=2*r;
        A(end, end-1)=0;
        A(1, 2)=0;
    else
        error('无法识别的边界条件。');
    end
    
    for i=2:points_count-1
        % 给矩阵中lambda的位置赋值。
        A(i, i+1)=1-u(i-1);
        A(i, i-1)=u(i-1);
    end
    M=A\d;
    % 计算插值多项式的系数。
    for i=1:points_count-1
        coefficients(1, i)=(M(i+1)-M(i))/(6*h(i));
        coefficients(2, i)=(M(i)*X(i+1)-M(i+1)*X(i))/(2*h(i));
        coefficients(3, i)=(M(i+1)*X(i)^2- M(i)*X(i+1)^2)/(2*h(i)) + (M(i)*h(i) - ...
            M(i+1)*h(i))/6 + (Y(i+1) - Y(i))/h(i);
        coefficients(4, i)=(Y(i)*X(i+1) - Y(i+1)*X(i))/h(i) + (M(i)*X(i+1)^3 - ...
            M(i+1)*X(i)^3)/(6*h(i)) + (M(i+1)*h(i)*X(i) - M(i)*h(i)*X(i+1))/6;
        regions(1, i)=X(i);
        regions(2, i)=X(i+1);
    end
    if plot
        plot_result(X, Y, coefficients, regions);
    end
end
function plot_result(X, Y, coefficients, regions)
    figure;
    hold on;
    plot(X, Y, 'ro');
    for i=1:size(regions, 2)
        x=linspace(regions(1, i), regions(2, i), 50);
        plot(x, polyval(coefficients(:, i), x));
    end
end
function new_arr=remove_element(arr, indices)
    new_arr=arr;
    new_arr(indices)=[];
end
function r = divdiff(X, Y)
    points_count=size(X, 2);
    if points_count==2
        r=(Y(2)-Y(1))/(X(2)-X(1));
    else
        r=(divdiff(remove_element(X, points_count-1), remove_element(Y, points_count-1))-...
            divdiff(remove_element(X, points_count), remove_element(Y, points_count)))/...
            (X(points_count)-X(points_count-1));
    end
end
