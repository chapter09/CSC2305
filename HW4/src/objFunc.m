function [ y, gy, hy ] = objFunc( x )
    t = num2cell(x);
    [x1, x2] = t{:};
    
    y = 10 * (x2 - x1^2)^2 + (1 - x1)^2;
    gy = [ 2*x1 - 40*x1*(- x1^2 + x2) - 2;...
        - 20*x1^2 + 20*x2];
    hy = [ 120*x1^2 - 40*x2 + 2, -40*x1;...
        -40*x1,     20];
end