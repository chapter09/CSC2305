x1 = 16;
x0 = 32;
index = 0;
TOL = 0.000000000001;

fprintf('i\tx_n\t\t|x_n - x_(n-1)|\tr\tC\n');
fprintf(['==\t==============\t==============='...
    ,'\t======\t=======\n']);

while 1
    
  index = index + 1;
  temp = iterX(x0, x1);
  diff = abs(temp - x1);
  
  r = log(abs(temp - x1)) / log(abs(x1 - x0)); 
  c = abs(temp - sqrt(2)) / (abs(x1 - sqrt(2)))^r;
  
  fprintf('%d\t%.10f\t%4.3G    \t%4.3G \t%.3G\n'...
      , index, temp, diff, r, c);
 
  if diff <= TOL
      break
  end
 
  x0 = x1;
  x1 = temp;
end