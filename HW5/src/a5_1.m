function a5_1()
    TOL = 1e-6;
    n_list = [5 8 12 20];
    disp([sprintf('n\t'), sprintf('k\t'),...
        sprintf('true error\t'), 'condition number']);
    disp('================================================');
    for n = n_list
        CG(hilb(n), zeros(n,1), TOL);       
    end
    
end
