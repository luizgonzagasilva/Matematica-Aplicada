function p = bezier_calc(t, pii)
  n = size(pii,2)-1;
  binomio = inline("factorial(n)/(factorial(i)*factorial(n-i))", "n", "i");
  p = pii'(1,:)*binomio(n,0)*(1-t)^3+pii'(2,:)*binomio(n,1)*t*(1-t)^2+pii'(3,:)*binomio(n,2)*t^2*(1-t)+pii'(4,:)*binomio(n,3)*t^3;
endfunction
