function [ output_args ] = objFunc( x )
    output_args = f1(x)^2 + f2(x)^2 + f3(x)^2;
end


function [output_args] = f1(x)
    output_args = 10 * (x(3) - 10 * thetaFunc(x(1), x(2)));
end


function [output_args] = f2(x)
    output_args = 10 * (sqrt(x(1)^2 + x(2)^2) - 1);
end


function [output_args] = f3(x)
    output_args = x(3);
end


function [output_args] = thetaFunc(x1, x2)
    if x1 > 0
        output_args = 1 / (2 * pi) * atan(x2 / x1);
    elseif x1 == 0
        output_args = 0.25;
    else
        output_args = 1 / (2 * pi) * atan(x2 / x1) + 0.5;
    end
end