function [ xiter, outputlist ] = newton( func, x, tol )
    [~, gx, hx] = feval(func, x);
    gxnorm = norm(gx,2);
    it = 1;
    xiter{it} = x;
%     outputlist(it, :) = [it, x(1), x(2), 0];
    outputlist(it, :) = [it, 0];


    
    while( gxnorm > tol )   
        p = - hx \ gx;
        alphak = backtracking(func, p, x, 0.5, 1e-4);
        x = x + alphak * p;

        it = it + 1;
        xiter{it} = x;   
%         disp(x);
        diff = norm(xiter{it} - xiter{it-1}, 2);  
%         outputlist(it, :) = [it, x(1), x(2), diff]; 
        outputlist(it, :) = [it, diff]; 


        [~, gx, hx] = feval(func, x);
        gxnorm = norm(gx,2);
    end
    disp(x);  
end