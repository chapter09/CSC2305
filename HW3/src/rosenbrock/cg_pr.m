% cg_pr  -  Conjugate Gradient Minimizer for general smooth f
%           Uses Polak-Ribiere update rule
%
%  [x,evalct] = cg_pr(fname,dfname,x,eta1,eta2)
%   fname - character string containing name of function
%  dfname - character string containing name of gradient evaluator
%       x - initial guess at solution
%    eta1 - stopping tolerance for relative error
%    eta2 - stopping tolerance for relative gradient
%
%       x - returned column vector answer
%   evals - number of 1D steps taken

% Philip D. Loewen
% 26 Feb 98 - original
%  1 May 01 - beautified
%  4 May 01 - stopping tests refined

function [x,evalct] = cg_pr(fname,dfname,x,eta1,eta2)

% A couple of parameters that can be adjusted before use.
Kmax = 30;
Zeps = eps^(3/4);
xtyp = ones(size(x));
ftyp = sqrt(eps);

% Initialization.
xo = x;
fx = eval([fname,'(x)']);     % Function value at initial point.
v  = eval([dfname,'(x)']);    % Gradient at initial point (row vector).
xtyp = abs(xtyp);             % Idiot-proofing: want positive components
ftyp = abs(ftyp);             % Idiot-proofing

k  = 0;                       % Counter for full CG steps.

vp(1,' ');

relstep = 2*eta1;
relgrad = max( abs(v) .* max(xtyp',x') ) / max([ftyp,fx]);

while (relstep>eta1) & (relgrad>eta2) & (k<Kmax),

  vp(2,['k=',sprintf('%2.0f',k),':  x''=',sprintf('  %14.8e',x')]);

  % Define direction in which to seek new point:
  if k==0,
    vp(1,['k= 0:  Gradient test = ',sprintf('%4.2e',relgrad),'.']);
    d = -v';       % No previous direction info available.
  else
    vp(1,['k=',sprintf('%2.0f',k),':  Gradient test = ',sprintf('%4.2e',relgrad),',', ...
          ' relative step in x = ',sprintf('%4.2e',relstep),'.']);
    b = ((v-vo)*v') / (vo*vo');    % Polak-Ribiere update rule
    b = max(0,b);                  % Optional sign restriction (see lectures)
    d = -v' + b*d; % New direction: steepest descent plus correction.
  end;

  vp(3,['k=',sprintf('%2.0f',k),':  d''=',sprintf('  %14.8e',d')]);

  % Do line search from base point x in direction d.
  maxit = 50;
  [t,evals] = linsrch(fname,x,d,eta1/100,maxit);
  if evals>=maxit,
    vp(1,['k=',sprintf('%2.0f',k),':  WARNING--Line search gave up exhausted.']);
  end;

  xo = x;         % Remember previous x-value,
  vo = v;         %  and previous gradient value.
  x = x + t*d;    % Update to new point.
  v = eval([dfname,'(x)']);  % Compute gradient at new point.
  fx = eval([fname,'(x)']);  % Compute function value also.

  vp(3,['k=',sprintf('%2.0f',k),':  t=',sprintf('  %10.4e',t)]);

  relstep = sum( abs(x'-xo')./ max([xtyp';abs(xo')]) );
  relgrad = max( abs(v) .* max(xtyp',x') ) / max([ftyp,fx]);

  k = k+1;

  vp(2,' ');
end;            % End of main loop.

evalct = k;
vp(1,['k=',sprintf('%2.0f',k),':  Stopping. ']);
vp(1,['k=',sprintf('%2.0f',k),...
      ':  Gradient test = ',sprintf('%4.2e',relgrad),',', ...
      ' relative step in x = ',sprintf('%4.2e',relstep),'.']);
vp(1,['k=',sprintf('%2.0f',k),':  Returning x shown below.']);
for j=1:size(x),
  vp(1,sprintf([blanks(ceil(7+log10(k+0.5))),'%20.14e'],x(j)));
end;
vp(1,' ');

return
