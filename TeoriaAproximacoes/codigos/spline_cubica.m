function s = spline_cubica(x)
  x0 = 0;
  a0 = 1.2667;
  b0 = 0;
  c0 = -3.2667;
  #c0 = -0.7333;
  d0 = 3;
  s = a0*(x - x0)^3 + b0*(x - x0)^2 + c0*(x - x0) + d0;