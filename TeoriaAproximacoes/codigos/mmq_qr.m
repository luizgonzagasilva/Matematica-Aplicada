function a = mmq_qr(x,y,k)
  n = length(x);
  X = vander(x);
  X = X(:,n-k:n);
  [Q R] = qr(X);
  a = (R\(Q'*y'))';
endfunction
