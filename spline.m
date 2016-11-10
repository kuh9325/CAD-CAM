clear all; clc; close all;
wh = input('enter 1 for keyboard direct input, 2 for mouse coordinate input : ');
n = input('set control point number : ');
if wh==1
    [p]=input('direct input -> [x1 y1; x2 y2; x3 y3; ...; xn yn] : \n');
    line(p(:,1),p(:,2))
    t = [0:0.01:1];
    xr = 0; yr = 0;
    for i = 1:n
        a = p(i,1) .* factorial(n-1) ./ (factorial(i-1) .* (factorial(n-i))) .* t.^(i-1) .* (1-t).^(n-i);
        b = p(i,2) .* factorial(n-1) ./ (factorial(i-1) .* (factorial(n-i))) .* t.^(i-1) .* (1-t).^(n-i);
    
        xr = xr + a;
        yr = yr + b;
    end
    hold on
    plot(xr,yr, '-r', 'LineWidth', 3)
    legend('Control Polygon', 'Bezier Curve')
    
elseif wh==2
    axis([0 100 0 100]);
    [x,y] = ginput(n);
    t = [0:0.01:1];
    xr = 0; yr = 0;
    for i = 1:n
        a = x(i) .* factorial(n-1) ./ (factorial(i-1) .* (factorial(n-i))) .* t.^(i-1) .* (1-t).^(n-i);
        b = y(i) .* factorial(n-1) ./ (factorial(i-1) .* (factorial(n-i))) .* t.^(i-1) .* (1-t).^(n-i);

        xr = xr + a;
        yr = yr + b;
    end
    plot(x,y)
    hold on
    plot(xr,yr, '-r', 'LineWidth', 3)
    legend('Control Polygon', 'Bezier Curve')
end