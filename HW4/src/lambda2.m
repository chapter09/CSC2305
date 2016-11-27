function [ y ] = lambda2( delta, x )    
    syms l positive;
    norm = sqrt(4/(l-18)^2 + 100/(20+l)^2);
    sol = vpasolve(norm == delta, l);    
    y = [x(1) + 2 / (sol-18); x(2) - 10 / (20 + sol)];
end

