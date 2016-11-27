function [ xiter, outputlist ] = BFGS( func, x, tol )
    [n, ~] = size(x);
    H = eye(n);    
    dist = 2*tol;
    
    it = 1;
    xiter{it} = x;
%     outputlist(it, :) = [it, x(1), x(2), 0];
    outputlist(it, :) = [it, 0];

    while dist > tol
        [~, grad] = func(x);
        p = -H * grad;

        alpha = backtracking(func, p, x, 0.5, 1e-4);
        
        x = x + alpha * p;
        disp(x);
        it = it + 1;
        xiter{it} = x;                
        diff = norm(xiter{it} - xiter{it-1}, 2);  
%         outputlist(it, :) = [it, x(1), x(2), diff]; 
        outputlist(it, :) = [it, diff]; 

        s = alpha * p;
        dist = norm(s);
        [~, newgrad] = func(x);
        y = newgrad - grad;
        rho = 1 / (y' * s);
        H = (eye(n) - rho * s * y') * H * (eye(n) - rho*y*s') ...
            + rho * (s * s');       
    end
    disp(x);  
end