function [ xiter, outputlist ] = trustRegion( x0, TOL )
    delta_max = 100;
    eta = 0.15;
    delta = 0.1;
    x = x0;
    it = 1;
    xiter{it} = x;
    outputlist(it, :) = [it, x(1), x(2), 0, 0];
    
    [~, gy, ~] = rosenbrock(x);
    
    while norm(gy) > TOL
        p_k = dogleg(@rosenbrock, x, delta);
        
        [y, gy, ~] = rosenbrock(x);
        [y1, ~, ~] = rosenbrock(x + p_k);
        rho_k = (y - y1) / (mk_rosenbrock(x, [0, 0]') - mk_rosenbrock(x, p_k));
        
        if rho_k < 0.25
            delta = 0.25*norm(p_k);
        elseif rho_k > 0.75 && norm(p_k) == delta
            delta = min(2*delta_old, delta_max);
        end
        
        if rho_k > eta
            x = x + p_k;
        end
        it = it + 1;
        
        xiter{it} = x;
        outputlist(it, :) = [it, x(1), x(2), p_k(1), p_k(2)]; 
    end
    
    
end

