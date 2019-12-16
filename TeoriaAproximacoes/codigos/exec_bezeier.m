xi = [1,2,4,5];
yi = [1,2,2.3,1.5];

xi = [1,2,8,10];
yi = [0,2,2.3,0];

#xi = [1,1,3,3,1];
#yi = [1,2,2,1,1];

pii = [xi; yi];

plot(xi, yi);

#t = 0:0.01:1; #Bezier
t = 0:0.1:6; #B-spline
for i=1:size(t,2)
   #p(i,:) = bezier(t(i), pii);
   #p(i,:) = bezier_calc(t(i), pii);
   [p(i,:),sN] = bspline(t(i),  pii);
   disp(sN)
endfor

plot( p(:,1), p(:,2) );

plot( xi, yi, p(:,1), p(:,2) );