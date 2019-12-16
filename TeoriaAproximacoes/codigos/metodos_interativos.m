########## gauss jacobi ##########

n = 3;

# forma matricial
Ax=b -> (A - D + D)x=b -> (A-D)x + Dx = b -> (A-D)x(k) + Dx(k+1) = b
Dx(k+1) = (D-A)x(k) + b -> x(k+1) = (I-inv(D)*A) + inv(D)*b

C = [
  0 -a12/a11 -a13/a11;
  -a21/a22 0 -a23/a22;
  -a31/a33 -a32/a22 0
  ];
  
b = [b1/a11 b2/a22 b3/a33];

x1(k+1) = (b1 - a12x2(k) - a13x3(k))/a11;
x2(k+1) = (b2 - a21x1(k) - a23x3(k))/a22;
x3(k+1) = (b3 - a31x1(k) - a32x2(k))/a33;

# convergencia 
# criterio das linhas
alpha = max(alpha(k))<1, alpha(k) = sum(akj)/|akk|;
# criterio das colunas
alpha = max(alpha(k))<1, alpha(k) = sum(aik)/|akk|;




########## gauss seidel #########

x1(k+1) = (b1 - a12x2(k) - a13x3(k))/a11;
x2(k+1) = (b2 - a21x1(k+1) - a23x3(k))/a22;
x3(k+1) = (b3 - a31x1(k+1) - a32x2(k+1))/a33;


#forma matricial
Ax=b -> A=L+R -> (L+R)x=b -> Lx+Rx=b -> Lx(k+1)=-Rx+b
x(k+1)=-inv(L)*Rx(k)+inv(L)*b

#sassenfeld
B = max(Bi)<1, B1 = sum({j=2:n}|a1j|)/|a11|, Bi = (sum{j=1:i-1}(|aij|*Bj+sum{j=i+1:n}(|aij|))/|aii|




########## Formas Quadraticas ##########

r(k) = b - Ax(k);
alpha(k) = r(k)*r(k)/r(k)*A*r(k);
x(k+1)=x(k) + alpha(k)*r(k).




















