function [ y ] = lambda( delta, x )    
    syms l positive;
    norm = sqrt(4/(42+l)^2 + 400/(20+l)^2);
    sol = vpasolve(norm == delta, l);    
    y = [x(1) + 2 / (42 + sol); x(2) + 20 / (20 + sol)];
end

