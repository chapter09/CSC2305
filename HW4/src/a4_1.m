function a4_1()
    
%     x = [0, -1]';
    x = [0, 0.5]';
   
    %% draw contour lines
%     fig = figure;               
%     ezcontour(@(p1, p2) mk(x, [p1, p2]'));
%     set(gcf, 'Position', [0 0 500 400]);
%     set(gca,'FontSize',14);
%     title('x = [0, 0.5]^T');
%     print(fig, '-depsc', '-r0', '../figs/q1-2');
    
    %% family of solutions
%     d = sqrt(1+(1/21^2));
    d = sqrt(1/81+1/4);
    figure;
    hold on;
    scatter(x(1), x(2), '.');        

    while d >= 0
%         new_x = lambda(d, x);
        new_x = lambda2(d, x);
%         disp(new_x);
        scatter(new_x(1), new_x(2), '.');
        d = d - 0.001;        
    end
    
    set(gcf, 'Position', [0 0 500 400]);
    set(gca,'FontSize',14);
    grid on;
    box on;
    xlabel('x_1');
    ylabel('x_2');
    
end