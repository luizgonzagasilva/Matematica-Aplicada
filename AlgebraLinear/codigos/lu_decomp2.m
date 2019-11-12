function [L,U] = lu_decomp2(A)
  
  % A: matriz quadrada
  % L: matriz triangular inferior
  % U: matriz triangular superior 
  
  n = size(A,1);
  L = eye(n);
  U = zeros(n);
  
  U(1,:) = A(1,:);
  L(:,1) = A(:,1)/U(1,:);   
  
  for k=1:n
   U(2:n,:) = A(2:n,2:n) - sum(L(2,1)*U(1,k));
   L(:,2:n) = (A(3:n,2) - sum(L(3:n,1)*U(1,2)))/U(2,2);
  end
  
  