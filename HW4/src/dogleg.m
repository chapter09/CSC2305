function [ p_k ] = dogleg( func, x, delta )
    [~, gy, hy] = func(x);
    
    p_u = - (gy'*gy) / (gy'*hy*gy) * gy;
    p_b = -inv(hy)*gy;
    
    % gauchy point (4.8)    
    if gy'*hy*gy <= 0
        tau = 1;
    else
        tau = min(norm(gy)^3/(delta*gy'*hy*gy), 1);
    end
    
    if tau >= 0 && tau <=1
        p_k = tau * p_u;
    elseif tau > 1 && tau <= 2
        p_k = p_u + (tau - 1)*(p_b - p_u);
    end
end