function [r, f, gf, Jr] = a5 ()
    
    t = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0];
    y = [6.80, 3.00, 1.50, 0.75, 0.48, 0.25, 0.20, 0.15];
    
    syms x1 x2;    
    r = log(y) - x1 - x2*t;
%     r = y - x1*exp(x2*t);
    f = 1/2*norm(r);
    gf = gradient(f);
    Jr = jacobian(r);
        
end
