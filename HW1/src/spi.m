function [ output ] = spi( func, u, v, w, TOL )

index = 0;

fprintf('SPI\n');
fprintf('i\tu\t\tv\t\tw\t\tfunc(v)\n');
fprintf(['==\t==============\t============='...
    ,'\t=============\t=============\n']);

fu = func(u);
fv = func(v);
fw = func(w);

x = v - ((v - u)^2 * (fv - fw) - (v - w)^2 * (fv - fu)) ...
    / (2 * ((v - u) * (fv - fw) - (v - w) * (fv -fw)));

while abs(v - u) > TOL && abs(v - w) > TOL && abs(u - w) > TOL
    index = index + 1;
    
    fprintf('%d\t%4g   \t%4g   \t%g\t\t%.3g\n', index, u, v, w, func(v));
    
    x = v - ((v - u)^2 * (fv - fw) - (v - w)^2 * (fv - fu)) ...
        / (2 * ((v - u) * (fv - fw) - (v - w) * (fv -fw)));
    
    fx = func(x);
    
    if x > v
        if fx > fv
            % (u, v, x)
            % fprintf('u v x\n')
            w = x;
            fw = fx;
        else
            % (v, x, w)
            % fprintf('v x w\n')
            u = v;
            fu = fv;
            v = x;
            fv = fx;
        end
    else
        if fx > fv
            % (x, v, w)
            % fprintf('x v w\n')
            u = x;
            fu = fx;
        else
            % (u, x, v)
            % fprintf('u x v\n')
            w = v;
            fw = fv;
            v = x;
            fv = fx;
        end
    end
end

output = x;

end