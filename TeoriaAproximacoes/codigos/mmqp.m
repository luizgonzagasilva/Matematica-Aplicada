function a = mmqp(x,y,w,k)
  n = length(x);
  W = diag(w);
  X = vander(x);
  X = X(:,n-k:n);
  a = ((X'*W*X)\(X'*W*y'))';
endfunction
