function x = gradiente_method(A,b,x0)
  r = b - A*x0;
  alpha = (r'*r)/(r'*(A*r));
  x = x0 + alpha*r;