function [ xiter, outputlist ] = stpDescent( func, x, tol )
    [~, gx, ~] = feval(func, x);
    gxnorm = norm(gx,2);

    it = 1;
    xiter{it} = x;
%     outputlist(it, :) = [it, x(1), x(2), 0];
    outputlist(it, :) = [it, 0];

    while( gxnorm > tol )
        s = -gx;
        alphak = backtracking(func, s, x, 0.5, 1e-4);
        x = x + alphak * s;
        disp(x);  
        [~, gx, ~] = feval(func, x);        
        it = it + 1;
        xiter{it} = x;
        diff = norm(xiter{it} - xiter{it-1}, 2);  
%         outputlist(it, :) = [it, x(1), x(2), diff]; 
        outputlist(it, :) = [it, diff]; 
                
        gxnorm = norm(gx,2);
    end
    disp(x);  
end