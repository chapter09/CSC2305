function a3_1()
    
    TOL = 10e-6;
    objFunc = @rosenbrock;
    start = [1.2, 1.2]';
    %     start = [-1.2, 1]';
    
    algs = {@stpDescent, @conjGrd, @BFGS, @newton};
    alg_names = {'stpDescent', 'conjGrd', 'BFGS', 'newton'};
    
    for i = 1:length(algs)
        [xiter, output] = algs{i}(objFunc, start, TOL);
        fig = draw(xiter);
        fig.PaperUnits = 'inches';
        fig.PaperPosition = [0 0 6 3];
        print(fig, '-depsc', '-r0', sprintf('../figs/%s-1', alg_names{i}));
        
        dlmwrite(sprintf('../output/1-%s-0.txt', alg_names{i}), ...
            output, 'delimiter','\t', 'precision', '%6.6g');
    end
end