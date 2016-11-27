function [ fig ] = draw( x )
    figure;

    set(gcf, 'Position', [0 0 500 200]);
    set(gca,'FontSize',14);
    
    hold on;
    grid on;
        
    X1 = NaN(length(x), 2);
    X2 = NaN(length(x), 2);
    X3 = NaN(length(x), 2);
    X4 = NaN(length(x), 2);
    X5 = NaN(length(x), 2);
    for i = 1:length(x)
        X1(i,:) = [i, x{i}(1)];
        X2(i,:) = [i, x{i}(2)];
        X3(i,:) = [i, x{i}(3)];
        X4(i,:) = [i, x{i}(4)];
        X5(i,:) = [i, x{i}(5)];
    end
    
  
    plot(X1(:,1), X1(:,2));
    plot(X2(:,1), X2(:,2));
    plot(X3(:,1), X3(:,2));
    plot(X4(:,1), X4(:,2));
    plot(X5(:,1), X5(:,2));
    xlabel('Iteration');
    ylabel('x');
    
    fig = gcf;
end
