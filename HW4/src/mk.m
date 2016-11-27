function [ m_k ] = mk( x_k, p )
    [y_k, gy_k, hy_k] = objFunc(x_k);
    m_k = y_k + gy_k' * p + 0.5 * p' * hy_k * p;
end