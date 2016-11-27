function a4_2()
    TOL = 0.0001;
    
    [xiter, output] = trustRegion([1.2, 1.2]', TOL);
    fig = draw(xiter);
    fig.PaperUnits = 'inches';
    fig.PaperPosition = [0 0 6 3];
    print(fig, '-depsc', '-r0', '../figs/q4-2-10');
    
    dlmwrite('../output/q4-2.txt', ...
            output, 'delimiter','\t', 'precision', '%6.6g');
end