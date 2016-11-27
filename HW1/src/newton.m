function [ output ] = newton( func, x, TOL )

x0 = x;
index = 0;

fprintf('i\tx\tfunc(x)\n');
fprintf(['==\t==============\t=============\n']);


while 1
    index = index + 1;
    x1 = x0 - (12/x0^7 - 12/x0^13) / (156/x0^14 - 84/x0^8);
    
    fprintf('%d\t%g\t%g\n', index, x0, func(x0))
    
    if abs(x1 - x0) <= TOL
        break
    end
    
    x0 = x1;
end

output = x1;

end

