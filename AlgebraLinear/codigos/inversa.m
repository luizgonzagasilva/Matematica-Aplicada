function B = inversa(A)
  % A: matriz nao-singular
  % B: inversa de A
  % I: matriz identidade
  
  n=size(A,1);
  I=eye(n);
  B=zeros(n);
  
  for k=1:n
    b=I(:,k);
    B(:,k) = eliminacao_gauss_pivot(A,b);
  end
  