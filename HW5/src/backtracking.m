function alphak = backtracking( f, d, x, rho, c )

    alphak = 1;
    [~, fk, ~, gk] = feval(f, x(1), x(2));
    xx = x;
    x = x + alphak * d;
    [~, fk1, ~, ~] = feval(f, x(1), x(2));
    
    while fk1 > fk + c * alphak * (gk' * d),
      alphak = alphak * rho;
      x = xx + alphak * d;
      [~, fk1, ~, ~] = feval(f, x(1), x(2));
    end
    
end