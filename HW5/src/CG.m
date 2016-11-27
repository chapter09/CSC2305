function [ x_k ] = CG( A, x, tol )    
    n = length(A);
    b = ones(length(x) , 1);
    r = A*x - b;
    p = -r;
    k = 0;
    
    while norm(r) > tol
        alpha = (r'*r) / (p'*A*p);
        x = x + alpha*p;
        old_r = r;
        r = r + alpha*A*p;
        beta = (r'*r) / (old_r' * old_r);
        p = -r + beta*p;
        k = k + 1;
    end
    
    x_k = x;
    % true error
    err = norm(invhilb(n)*b - x); 
    disp([sprintf('%g\t', n), sprintf('%g\t', k),...
        sprintf('%g\t', err), sprintf('%g', cond(A))]);
end

