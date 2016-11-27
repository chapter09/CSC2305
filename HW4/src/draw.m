function [ fig ] = draw( x )
    figure;

    set(gcf, 'Position', [0 0 500 200]);
    set(gca,'FontSize',14);
    
    hold on;
    grid on;
    box on;
        
    X = NaN(length(x), 2);
    Y = NaN(length(x), 2);
    for i = 1:length(x)
        X(i,:) = [i, x{i}(1)];
        Y(i,:) = [i, x{i}(2)];
    end
    
  
    plot(X(:,1), X(:,2));
    plot(Y(:,1), Y(:,2));
    xlabel('Iteration');
    ylabel('x');
    
    fig = gcf;
end
