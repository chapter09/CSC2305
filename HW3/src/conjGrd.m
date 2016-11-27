function [ xiter, outputlist ] = conjGrd( func, x, tol )
    [~, gx, ~] = feval(func, x);
    gxnorm = norm(gx,2);
    
    old_gx = gx;
    p = -gx;
    it = 1;
    xiter{it} = x;
%     outputlist(it, :) = [it, x(1), x(2), 0];
    outputlist(it, :) = [it, 0];

        
    while( gxnorm > tol )
        
        b = (gx' * (gx - old_gx)) / (old_gx' * old_gx);
        b = max(b, 0);        
        p = -gx + b * p;
        alphak = backtracking(func, p, x, 0.5, 1e-4);
        x = x + alphak * p;
%         disp(x);
        it = it + 1;
        xiter{it} = x;                
        diff = norm(xiter{it} - xiter{it-1}, 2);  
%         outputlist(it, :) = [it, x(1), x(2), diff];    
        outputlist(it, :) = [it, diff]; 

        [~, gx, ~] = feval(func, x);
        gxnorm = norm(gx,2);
    end
    disp(x);  
end