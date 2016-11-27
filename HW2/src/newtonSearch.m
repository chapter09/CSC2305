function [ output_args ] = newtonSearch( func, x0, tol )
    x = x0;
    while 1
        p = pN(x(1), x(2));
        xNew = x + p;
        x = xNew;
        display([xNew x]);
        if (func(xNew) - func(x)) <= tol
            break;
        end
        output_args = xNew;
    end
end


function [output_args] = pN( x, y )
    if x == 0
        hessianF1 = [0, 0, 0; 0, 0, 0; 0, 0, 0];
        nabF1 = [0; 0; 0];
    else
        hessianF1 = [ (100*y^3)/(pi*x^5*(y^2/x^2 + 1)^2) - (100*y)/(pi*x^3*(y^2/x^2 + 1)), 50/(pi*x^2*(y^2/x^2 + 1)) - (100*y^2)/(pi*x^4*(y^2/x^2 + 1)^2), 0;...
                     50/(pi*x^2*(y^2/x^2 + 1)) - (100*y^2)/(pi*x^4*(y^2/x^2 + 1)^2), (100*y)/(pi*x^3*(y^2/x^2 + 1)^2), 0;...
                     0, 0, 0];
        
        nabF1 = [(50*y)/(pi*x^2*(y^2/x^2 + 1));
                      -50/(pi*x*(y^2/x^2 + 1));
                                           10];
    end

    hessianF = ...
        [ 10/(x^2 + y^2)^(1/2) - (10*x^2)/(x^2 + y^2)^(3/2), -(10*x*y)/(x^2 + y^2)^(3/2), 0;...
        -(10*x*y)/(x^2 + y^2)^(3/2), 10/(x^2 + y^2)^(1/2) - (10*y^2)/(x^2 + y^2)^(3/2), 0;...
        0, 0, 0] ...
        + hessianF1;
    
    display(hessianF);
    
    nabF = [ (10*x)/(x^2 + y^2)^(1/2); (10*y)/(x^2 + y^2)^(1/2); 0]...
        + [0; 0; 1] + nabF1;
    
    output_args = - pinv(hessianF) * nabF;
end

