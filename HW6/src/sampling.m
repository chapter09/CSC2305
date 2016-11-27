function [] = sampling()
    x0 = [1.1911, 1.3626, 1.4728, 1.6350, 1.6791];
    
    for i = -5:5
        x1 = x0(1)+i*0.1;
        x2 = x0(2)+i*0.1;
        x3 = (3*sqrt(2)+2-x1-(x2)^2)^(1/3);
        x4 = (2*sqrt(2)-2-x2+(x3)^2);
        x5 = 2/x1;
        x = [x1,x2,x3,x4,x5];
        fx = objFunc(x);
        disp([x1,x2,x3,x4,x5,fx]);                
    end        
end