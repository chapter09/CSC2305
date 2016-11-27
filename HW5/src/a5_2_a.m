function a5_2_a()
    func = @objFunc;
    TOL = 1e-6;
    x0 = [2, -1]';
    x = x0;
    [~, ~, ~, gy] = func(x(1), x(2));
    n = 0;
    
    disp([sprintf('n\t'), sprintf('x1\t\t'), sprintf('x2\t\t'),...
        sprintf('norm(gy)\t'), 'f(x)']);
    disp(['====================================', ...
        '====================================']);
    
    while norm(gy) > TOL
        
        [r, y, Jr, gy] = func(x(1), x(2));
        %% normal equations
        %         p = - inv(Jr'*Jr)*Jr'*r;
        
        
        %% QR
        %         [Q,R,E] = qr(Jr);
        %         p = -E/R*Q'*r;
        
        
        %% SVD
        [U,S,V] = svd(Jr, 0);
        p = -V/S*U'*r;
        
        alpha = backtracking(func, p, x, 0.5, 0.1);
        x = x + alpha*p;
        n = n + 1;
        
        disp([sprintf('%g\t', n), sprintf('%f\t', x(1)), ...
            sprintf('%f\t', x(2)), sprintf('%f\t', norm(gy)), ...
            sprintf('%f\t', y)]);
    end
    %     disp(x);
    
    %% plot
    t = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0];
    y = [6.80, 3.00, 1.50, 0.75, 0.48, 0.25, 0.20, 0.15];
    
    figure;
    hold on;
    box on;
    grid on;
    scatter(t, y, 'x');
    set(gcf, 'Position', [0 0 300 400]);
    set(gca,'FontSize',14);
    fplot(@(a) x(1)*exp(x(2)*a), [0 5]);
end