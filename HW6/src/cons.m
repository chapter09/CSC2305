function [ c, ceq ] = cons( x )    
    a = [3*sqrt(2)+2; 2*sqrt(2)-2; 2];
    
    y = [x(1)+x(2)^2+x(3)^3; ...
        x(2)-x(3)^2+x(4); ...
        x(1)*x(5)];
    
    ceq = norm(y - a);
    c = [];
end

