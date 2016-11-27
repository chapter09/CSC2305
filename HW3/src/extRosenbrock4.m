function [ y, gy, hy ] = extRosenbrock4( x )
    t = num2cell(x);
    [v1, v2, v3, v4] = t{:};

    y = (conj(v1) - 1)*(v1 - 1) + (conj(v3) - 1)*(v3 - 1)...
        + (10*conj(v2) - 10*conj(v1)^2)*(- 10*v1^2 + 10*v2)...
        + (10*conj(v4) - 10*conj(v3)^2)*(- 10*v3^2 + 10*v4);

    gy = [v1 + conj(v1) - 20*v1*(10*conj(v2) - 10*conj(v1)^2) - 20*conj(v1)*(- 10*v1^2 + 10*v2) - 2;
        100*v2 + 100*conj(v2) - 100*conj(v1)^2 - 100*v1^2;
        v3 + conj(v3) - 20*v3*(10*conj(v4) - 10*conj(v3)^2) - 20*conj(v3)*(- 10*v3^2 + 10*v4) - 2;
        100*v4 + 100*conj(v4) - 100*conj(v3)^2 - 100*v3^2];
    
    hy = [200*conj(v1)^2 - 200*conj(v2) - 200*v2 + 800*v1*conj(v1) + 200*v1^2 + 2, - 200*v1 - 200*conj(v1),                                                          0,0;
        - 200*v1 - 200*conj(v1), 200, 0, 0;
        0,0,200*conj(v3)^2 - 200*conj(v4) - 200*v4 + 800*v3*conj(v3) + 200*v3^2 + 2, - 200*v3 - 200*conj(v3);
        0,0,- 200*v3 - 200*conj(v3),200];
end

