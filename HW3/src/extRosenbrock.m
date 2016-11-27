function [ y, gy, hy ] = extRosenbrock( x )

    [n, ~] = size(x);
    r = sym(zeros(n, 1));
    v = sym('v', [n, 1]);
    
    for i = 1 : 2 : n - 1
        r(i) = 10.0 * (v(i + 1) - v(i)^2);
        r(i + 1) = 1.0 - v(i);
    end
    
    y = r' * r;
    gy = gradient(y, v);
    hy = hessian(y, v);
    
    y = vpa(subs(y, v, x), 5);
    gy = vpa(subs(gy, v, x), 5);
    hy = vpa(subs(hy, v, x), 5);

end