######### projecao ortogonal #########
v* = alpa*v;
<u-v*,v> = <u-alpa*v,v> = 0;
alpha = <u,v>/<v,v>;
v* = pr_v(u) = (<u,v>/<v,v>)*v

#espaco vetoriais
v* = alpha0*xPhi0 + alpha1*xPhi1 + .. + alphan*xPhin

A = [
  <phi0,phi0> .. <phi0,phin>;
      ..             ..
  <phin,phi0> .. <phin,phin>
  ];
  
b = [<u,phi0>, <u,phi1>,..,<u,phin>];

Aa=b, a = alpha;

# desigualdade de cauchy-shwaz
|<u,v>| <= ||u||*||v||;

u=0 ou v=0 -> |<u,v>| = ||u||*||v||

u<>0 e v<>0 -> pr_v(u)=(<u,v>/||v||^2)*v <= u

||pr_v(u)|| = ||(<u,v>/||v||^2)*v|| <= ||u|| 

|<u,v>|*||v||/||v||^2<=||u|| -> |<u,v>|<=||u||*||v||;

# metodo dos minimos quadrados
f -> {phi0, phi1, .., phin};
F* = alpha0* x phi0 + alpha1* x phi1 + .. + alphan* x phin;

dist(f,F*) -> Q = min{alpha*}||f-F*||^2

# portanto encontrar a funcao: F* = alpha0* x phi0 + alpha1* x phi1 + .. + alphan* x phin;

A = [
  <phi0,phi0> .. <phi0,phin>;
      ..             ..
  <phin,phi0> .. <phin,phin>
  ];
  
b = [<f,phi0>, <f,phi1>,..,<f,phin>];

Aa=b, a = alpha;


# aproximacao polinomial: caso contínuo
f pertence C([a,b]) -> Pm

f(X) = alpha0* + alpha1* x X + alpha2* x X^2 + .. + alpham* x X^m = Pm(X);

Q = ||f-Pm||^2 = <f-Pm,f-Pm> = int{a:b}(f(x)-Pm(x))^2dx

B = {1, x, x^2,.., x^m} base de Pm

A = [
  <1,1>  <1,x> .. <1,x^m>;
  <x,1>  <x,x> .. <x,x^m>;
    ..     ..  ..   ..
  <x^m,1>  <x^m,x> .. <x^m,x^m>
  ];
  
b = [<f,1>, <f,x>,..,<f,x^m>];

Aa=b, a = alpha;

<f,g> = int{a:b}(f(x)*g(x))dx


# erro truncamento: caso contínuo
Q = ||f-F*||^2;


# aproximacao polinomial: caso discreto

f(X) ~ alpha0* + alpha1* x X + alpha2* x X^2 + .. + alpham* x X^m = Pm(X), com m<n;

<f,g> = sum{k=0:n}(f(xk)*g(xk));

Q = ||f-Pm||^2 = <f-Pm,f-Pm> = sum{k=0:n}(yk - Pm(xk))^2

Y = (y0, y1,.., yn) pertence R^(n+1);
P = (Pm(x0), Pm(x1),.., Pm(xn)) pertence R^(n+1);

P = alpha0*[1 1 .. 1]' + alpha1*[x0, x1,..,xn]' + .. +  alphan*[x0^n, x1^n,..,xn^n]';

u0 = [1 1 .. 1]';
u1 = [x0, x1,..,xn]';
um = [x0^m, x1^m,..,xn^m]';

P = alpha0*u0 + alpha1*u1 + .. +  alphan*un;

A = [
  <u0,u0> .. <u0,um>;
      ..             ..
  <um,u0> .. <um,um>
  ];
  
b = [<u0,y>, <u1,y>,..,<um,y>];

Aa=b, a = alpha;

X'X*alpha* = X'*y -> alpha* = inv(X'X)*y;

X = [
  1 x0 x0^2 .. x0^m;
  1 x1 x1^2 .. x1^m;
  .  .  ..  ..  ..
  1 xn xn^2 .. xn^m
  ];
  
# forma matricial revisada
A = Q*R, R = tr. superior, Q = ortogonal

X'X*alpha* = X'*y -> (QR)'(QR)*alpha* = (QR)'y

R'(Q'Q)R*alpha* = R'Q'y -> R*alpha* = Q'y


# impondo restrinções 

f(x) ~ alpha0* + alpha1*x + alpha2*x^2 = P2(x);

P2(2) = 7, alpha0* + 2*alpha1* + 4*alpha2* =7 ;

#1
alpha2* = (7 - alpha0* - 2*alpha1*)/4
P2(x) =  alpha0* + alpha1*x + ((7 - alpha0* - 2*alpha1*)/4)*x^2

#2
f(x) ~ 7/4*x^2 + alpha0*(1 - 1/4*x^2) + alpha1*(x - 1/2*x^2)
psi = -7/4*x^2, phi0 = (1 - 1/4*x^2), phi1 = (x - 1/2*x^2);

#3
G ~ alpha0*phi0 + alpha1*phi1, G = f + psi;

#4
A = [
  <phi0,phi0> <phi0,phi1>;
  <phi1,phi0> <phi1,phi1>
  ];

b = [<G,phi0> <G,phi1>]';

#5
P2(x) = ...


# outras aproximacoes
#1
f(x) ~ ab^x;

ln(f(x)) ~ ln(a)*1 + ln(b)*x;

F(x) = ln(f(x)), alpha0* = ln(a), phi0 = 1, alpha1* = ln(b), phi1 = x;

a = e^(alph0*), b e^(alpha1*);


# minimos quadrados ponderado

M*alpha* = X'*W*y

M = X'*W*X, W = diag(w0, w1, ..,wn);
alpha* = inv(M)*X'*W*y;




