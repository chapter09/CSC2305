function a3_2()

    TOL = 10e-6;       
    start1(1:4) = 1.2;
    start2(1:8) = 1.2;
    start3(1:16) = 1.2;

    input = {start1, start2, start3};
    algs = {@stpDescent, @conjGrd, @BFGS, @newton};
    obj = {@extRosenbrock4, @extRosenbrock8, @extRosenbrock16};
    alg_names = {'stpDescent', 'conjGrd', 'BFGS', 'newton'};

    for j = 1:length(input)        
        start = input{j}';        
        for i = 1:length(algs)
            
            [~, output] = algs{i}(obj{j}, start, TOL);        
            disp(alg_names{i});
            
    %         fig = draw(xiter);
    %         fig.PaperUnits = 'inches';
    %         fig.PaperPosition = [0 0 6 3];
    %         print(fig, '-depsc', '-r0', sprintf('../figs/2-%s-%d', alg_names{i}, j));

            dlmwrite(sprintf('../output/2-%s-%d.txt', alg_names{i}, j), ...
                output, 'delimiter','\t', 'precision', '%6.6g');        
        end
    end
end