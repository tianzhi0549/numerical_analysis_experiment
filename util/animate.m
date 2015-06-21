function animate(theta, r, fps)
% 动画绘制函数图像(极坐标).
    for len=1:size(theta, 2)
        pause(1/fps);
        polar(theta(1:len), r(1:len));
        hold on;
        if len<size(theta, 2)
            draw_ray(theta(len));
        end
        hold off;
    end
end

function draw_ray(theta)
    r=0:0.1:100;
    polar(ones(1, size(r, 2))*theta, r, 'r--');
end
