function a5_3()
    TOL = 1e-6;
    
    disp([sprintf('k  '), sprintf('true error\t'), ...
        sprintf('left1\t'), sprintf('right1\t\t'), ...
        sprintf('left2\t'), sprintf('right2\t'), ...
        sprintf('ineq1  '), sprintf('ineq2')]);
    disp(['================================================', ...
        '==================']);
    
    n = 100;
    M = rand(n, n);
    A = M'*M;
    x_opt = repmat([1, -1], 1, 50)';
    b = A*x_opt;
    
    x0 = zeros(n, 1);
    x = x0;
    r = A*x - b;
    p = -r;
    k = 0;
    e = eig(A);
    
    while norm(r) > TOL
        ineq1 = 'F';
        ineq2 = 'F';
        alpha = (r'*r) / (p'*A*p);
        old_x = x;
        x = x + alpha*p;
        old_r = r;
        r = r + alpha*A*p;
        beta = (r'*r) / (old_r' * old_r);
        p = -r + beta*p;
        
        err = norm(x_opt - x);
        
        if k >= n
            disp([sprintf('%g  ', k),...
                sprintf('%.3f\t\t\t\t\t      ', err), ineq1, sprintf('  '), ineq2]);
        else
            left1 = (x - x_opt)'*A*(x - x_opt);
            right1 = (e(n-k) - e(1) / e(n-k) + e(1))^2 ...
                * (x0 - x_opt)'*A*(x0 - x_opt);
            
            left2 = sqrt((old_x-x_opt)'*A*(old_x-x_opt));
            right2 = 2*((sqrt(e(n)/e(1))-1)/(sqrt((e(n)/e(1)))+1))^k ...
                * sqrt((x0-x_opt)'*A*(x0-x_opt));
            
            if left1 <= right1
                ineq1 = 'T';
            end
            
            if left2 <= right2
                ineq2 = 'T';
            end
            
            disp([sprintf('%g  ', k),...
                sprintf('%6.3g\t', err), sprintf('%3.3f\t', left1), ...
                sprintf('%8.3g\t ', right1), sprintf('%4.3f\t', left2), ...
                sprintf('%.3g  ', right2), ineq1, sprintf('  '), ineq2]);
        end
        k = k + 1;
    end
end
