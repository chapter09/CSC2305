function a6_2
    TOL = 1e-6;
    
    %% fmincon
%     x0 = zeros(5, 1);
%     options = optimoptions('fmincon','Display','iter');
%     [x, fval] = fmincon(@(x) objFunc(x), x0, ...
%         [],[],[],[],[],[], @(x) cons(x), options);
%     
%     disp(x);
%     disp(fval);
    
    %% newton
    x0 = ones(8, 1);
    
    [xiter, output] = newton(@lagrangian, x0, TOL);
    fig = draw(xiter);
    fig.PaperUnits = 'inches';
    fig.PaperPosition = [0 0 6 3];
    print(fig, '-depsc', '-r0', sprintf('../figs/a6-2-1'));
    
    dlmwrite(sprintf('../output/a6-2-1.txt'), ...
        output, 'delimiter','\t', 'precision', '%6.6g');
end
