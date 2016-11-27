function [ m_k ] = mk_rosenbrock( x, p )
    
    [y_k, gy_k, hy_k] = rosenbrock(x);    
    m_k = y_k + gy_k' * p + 0.5 * p' * hy_k * p;
    
end

