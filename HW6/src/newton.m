function [ xiter, outputlist ] = newton( func, x, tol )
    [~, gx, hx] = feval(func, x);
    gxnorm = norm(gx,2);
    it = 1;
    xiter{it} = x;
    outputlist(it, :) = [it, 0];
    
    while( gxnorm > tol )   
        p = -inv(hx) * gx;
        alphak = backtracking(func, p, x, 0.5, 0.1);
        x = x + alphak * p;

        it = it + 1;
        xiter{it} = x;   
        disp([x(1), x(2), x(3), x(4), x(5), x(6), x(7), x(8)]);
        diff = norm(xiter{it} - xiter{it-1});  
        outputlist(it, :) = [it, diff]; 

        [~, gx, hx] = feval(func, x);  
        gxnorm = norm(gx,2);
    end
    disp(x);
%     disp(gx);
%     disp(hx);
end