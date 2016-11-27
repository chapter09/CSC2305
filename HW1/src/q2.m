% gss(@LJfunc, 0, 2, 0.0001);

%spi(@LJfunc, 0.999, 1.022, 1.1111125, 0.000000001);

spi(@LJfunc, 0.3, 1.022, 1.4125, 0.000000001);

% newton(@LJfunc, 0.3, 0.00001);

% fminbnd(@LJfunc, 0, 3, optimset('TolX',0.0000001,'Display','iter'));