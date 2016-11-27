function [ y, gy, hy ] = lagrangian( x )
    t = num2cell(x);
    [x1, x2, x3, x4, x5] = t{1:5};
    [lambda1, lambda2, lambda3] = t{6:8};
    
    
    y = (x1 - x2)^2 + (x2 - x3)^2 ...
        + (x3 - x4)^4 + (x4 - x5)^4 ...
        - lambda1*(x2^2 + x3^3 + ...
        x1 - 3514294284039789/562949953421312) ...
        - lambda2*(- x3^2 + x2 + x4 ...
        - 1865452045155277/2251799813685248) ...
        + (x1 - 1)^2 - lambda3*(x1*x5 - 2);
    
    gy = [4*x1 - lambda1 - 2*x2 - lambda3*x5 - 2;
        4*x2 - 2*x1 - lambda2 - 2*x3 - 2*lambda1*x2;
        2*x3 - 2*x2 + 4*(x3 - x4)^3 + 2*lambda2*x3 - 3*lambda1*x3^2;
        4*(x4 - x5)^3 - 4*(x3 - x4)^3 - lambda2;
        - 4*(x4 - x5)^3 - lambda3*x1;
        - x2^2 - x3^3 - x1 + 3514294284039789/562949953421312;
        x3^2 - x2 - x4 + 1865452045155277/2251799813685248;
        2 - x1*x5];
    
    hy = [4, -2, 0, 0, -lambda3, -1, 0, -x5;
        -2, 4 - 2*lambda1, -2, 0, 0, -2*x2, -1, 0;
        0, -2, 2*lambda2 + 12*(x3 - x4)^2 - 6*lambda1*x3 + 2, -12*(x3 - x4)^2, 0, -3*x3^2, 2*x3,   0;
        0, 0,  -12*(x3 - x4)^2, 12*(x3 - x4)^2 + 12*(x4 - x5)^2, -12*(x4 - x5)^2,       0,   -1,   0;
        -lambda3,  0, 0, -12*(x4 - x5)^2,  12*(x4 - x5)^2,  0,    0, -x1;
        -1, -2*x2, -3*x3^2, 0, 0,       0,    0,   0;
        0, -1, 2*x3, -1, 0,       0,    0,   0;
        -x5, 0, 0, 0, -x1,       0,    0,   0];
    
end

