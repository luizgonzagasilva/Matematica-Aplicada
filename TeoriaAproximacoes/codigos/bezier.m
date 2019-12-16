function p = bezier(t, pii)
  n = size(pii,2)-1;
  p = 0;
  for i = 0:n
    binomio = factorial(n)/(factorial(i)*factorial(n-i));
    B = binomio*t^i*(1-t)^(n-i);
    p = p + pii(:,i+1)'*B;
  end


