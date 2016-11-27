function alphak = backtracking( f, d, x, rho, c )

    alphak = 1;
    [fk, gk] = feval(f, x);
    xx = x;
    x = x + alphak * d;
    fk1 = feval(f, x);
    
    while fk1 > fk + c * alphak * (gk' * d),
      alphak = alphak * rho;
      x = xx + alphak * d;
      fk1 = feval(f, x);
    end
    
end