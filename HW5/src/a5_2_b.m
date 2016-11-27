function a5_2_b()
    func = @objFunc2;
%     TOL = 1e-6;        
    n = 0;
    
    disp([sprintf('n\t'), sprintf('x1\t\t'), sprintf('x2\t\t'),...
        sprintf('norm(gy)\t'), 'f(x)']);
    disp(['====================================', ...
        '====================================']);
            
        [r, y, Jr, gy] = func(0, 0);
        %% normal equations
%         x = - inv(Jr'*Jr)*Jr'*r;        
        
        %% QR
%         [Q,R,E] = qr(Jr);
%         x = -E/R*Q'*r;        
        
        %% SVD
        [U,S,V] = svd(Jr, 0);
        x = -V/S*U'*r;                
        
        disp([sprintf('%g\t', n), sprintf('%f\t', x(1)), ...
            sprintf('%f\t', x(2)), sprintf('%f\t', norm(gy)), ...
            sprintf('%f\t', y)]);    
    %     disp(x);
    
    %% plot
    t = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0];
    y = [6.80, 3.00, 1.50, 0.75, 0.48, 0.25, 0.20, 0.15];
    
    figure;
    hold on;
    box on;
    grid on;
    scatter(t, log(y), 'x');
    set(gcf, 'Position', [0 0 300 400]);
    set(gca,'FontSize',14);
    fplot(@(a) x(1) + x(2)*a, [0 5]);
end