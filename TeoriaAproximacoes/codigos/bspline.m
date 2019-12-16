function [p,sN] = bspline(t, pii)
  
  n  = size(pii,2);
  k  = 3;
  ti = 0:0.1:n+k-1;
  p  = 0;
  sN = 0;
  
  for i = 1:n
    N = base_bspline(k, i, ti,t);
    sN = sN + N;
    p = p + pii(:,i)'*N;
  end

