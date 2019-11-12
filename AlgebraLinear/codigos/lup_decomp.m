function [L,U,P]=lup_decomp(A)
  % A: matriz nao-singular
  % L: matrizes triangular inf. e sup.
  % P: matriz de permutacao
  
  n=size(A,1);
  P=eye(n);
  L=P;
  U=A;
  
  for k=1:n
    [~,p] = max(abs(U(k:n,k)));
    p=p+(k-1);
    P([k p],:)=P([p k],:);
    U([k p],k:n)=U([p k],k:n);
    L([k p],1:k-1)=L([p k],1:k-1);
    for i=k+1:n
      L(i,k)=U(i,k)/U(k,k);
      U(i,k:n)=U(i,k:n)-L(i,k)*U(k,k:n);
    end
  end 
     