function [ output ] = gss( func, a, b, TOL)

tau = (sqrt(5) -1) / 2;
x1 = a + (1 - tau) * (b - a);
f1 = func(x1);
x2 = a + tau * (b - a);
f2 = func(x2);
index = 0;

fprintf('golden section search\n');
fprintf('i\ta\t\tb\t\tf(x_1)\t\tf(x_2)\n');
fprintf(['==\t==============\t============='...
    ,'\t=============\t=============\n']);

while (b - a) > TOL
    index = index + 1;
    fprintf('%d\t%.10f\t%.10f\t%.10f\t%.10f\n',index, a, b, f1, f2);
    if f1 > f2
        a = x1;
        x1 = x2;
        f1 = f2;
        x2 = a + tau * (b - a);
        f2 = func(x2);
    else
        b = x2;
        x2 = x1;
        f2 = f1;
        x1 = a + (1 - tau) * (b - a);
        f1 = func(x1);
    end
end

output = a;

