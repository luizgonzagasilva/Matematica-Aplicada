############## forma de lagrange ##############

Pn(x) = y0l0(x)+y1l1(x)+...+ynln(x)=sum{k=0:n}yklk(x);

lk(x) = multi{i=0:n}(x-xi)/(xk-xi), k=0,1,..,n


############## forma de Newton ##############

Pn(x) = alpha0 + alpha1(x-x0) + alpha2(x-x0)(x-x1)+...+alphan(x-x0)(x-x1)...(x-xn-1)

alphak = f[x0,x1,..,xk], k=0,1,2,..,n

f[xi,xi+1,..xi+k] := (f[xi+1,xi+2,..,xi+k] - f[xi,xi+1,..,xi+k-1])/(xi+k - xi);
com k=0,1,..n e i=0,1,..,n-k

#ordem 0
f[xi]=f(xi);
#ordem 1
f[xi,xj]= (f[xj]-f[xi])/(xj-xi);
#ordem k
f[xi0,xi1,..xik] := (f[xi1,xi2,..,xik] - f[xi0,xi1,..,xik-1])/(xik - xi0);

# tabela diferencas divididas
x         ordem0          ordem1              ordem2                ordem3
x0     f[x0]=alpha0     f[x0,x1]=alpha1    f[x0,x1,x2]=alpha2    f[x1,x2,x3]=alpha3
x1        f[x1]           f[x1,x2]            f[x1,x2,x3]             ...
x2        f[x2]           f[x2,x3]              ...                   ...
x3        f[x3]              ...                ...                   ...


############## interpolacao de hermite ##############
f[xk,..,xk]=1/(m-1)!*f^(m-1)(xk);

# tabela diferencas divididas
x         ordem0          ordem1              ordem2                ordem3
x0     f[x0]=alpha0     f[x0,xo]=alpha1    f[x0,x0,x1]=alpha2    f[x0,x0,x1,x1]=alpha3
x0        f[x0]           f[x0,x1]            f[x0,x1,x1]             ...
x1        f[x1]           f[x1,x1]              ...                   ...
x1        f[x1]              ...                ...                   ...

P3(x) = alpha0 + alpha1(x-x0) + alpha2(x-x0)^2+alpha3(x-x0)^2(x-x1)



############## erro de interpolacao ##############
||En(x)|| <= 1/(n+1)!*||f^(n+1)||_inf multi{i=0:n}|x-xi|
||En||_inf <= 1/(n+1)!*||f^(n+1)||_inf(b-a)^(n+1)

||Rn(x)|| <= 1/(2n+2)!*||f^(2n+2)||_inf multi{i=0:n}(x-xi)^2
||Rn||_inf <= 1/(2n+2)!*||f^(2n+2)||_inf(b-a)^(2n+2)



############## spline linear S1(x) ##############
S1,i = yi*(xi+1-x)/(xi+1-xi) + yi+1*(x-xi)/(xi+1-xi);
x pertence [xi,xi+1], i=0,1,..,n-1;

#erro
||f-S1||_inf<=(h^2)/8*||f''||_inf, com h = max(|xi-xi+1|)


############## spline cubica S3(x) ##############
S3,i(x)=ai(x-xi)^3+bi(x-xi)^2+ci(x-xi)+di;

ai = (zi+1-zi)/(6hi), bi = zi/2,
ci = -hi*zi+1/6 - hi*zi/3 + (yi+1-yi)/hi, di=yi, hi=xi+1-xi;


A = [
u1 h1 0 0 ... 0;
h1 u2 h2 0 .. 0;
   h2 u3 h3 ..0;
      h3 u4  h4
      ];
      
b = [v1 v2 ... vn-1];

ui = 2(hi + hi-1), vi = wi - wi-1, wi = 6/hi*(yi+1-yi)

#erro
||f-S3||_inf<=(5h^4)/384*||f^4||_inf, com h = max(|xi-xi+1|)


############## Bezier ##############
p(t) = sum{i=0:n}(pi*B{n,i}(t));
B{n,i}(t) = binomio(n,i)*t^i*(1-t)^(n-1);

p:[0,1]->R^3


############## B-splines ##############
p(t) = sum{i=0:n}(pi*N{k,i}(t)), com 2<=k<=(n+1);

N{1,i}(t) = 1 se ti<=t<ti+1 ou 0 caso contrario

N{k,i}(t) = (t-ti)*N{k-1,i}(t)/(ti+k-1 - ti) + (ti+k - t)*N{k-1,i+1}(t)/(ti+k - ti+1);

onde t0<=t1<=..<=tn+k

p:[t0,tn+k]->R^3






