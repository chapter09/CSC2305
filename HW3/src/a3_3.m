function a3_3()

    TOL = 10e-6;
    objFunc = @bealsFunction;
%     start = [1.2, 1.2]';
    start = [-1.2, 1]';

    algs = {@stpDescent, @conjGrd, @BFGS, @newton};
    alg_names = {'stpDescent', 'conjGrd', 'BFGS', 'newton'};

    for i = 1:length(algs)
        if i ~= 4
            continue;
        end
        [xiter, output] = algs{i}(objFunc, start, TOL);
        disp(alg_names{i});

        fig = draw(xiter);
        fig.PaperUnits = 'inches';
        fig.PaperPosition = [0 0 6 3];
        print(fig, '-depsc', '-r0', sprintf('../figs/3-%s-2', alg_names{i}));

        dlmwrite(sprintf('../output/3-%s-2.txt', alg_names{i}), ...
            output, 'delimiter','\t', 'precision', '%6.6g');
    end
end