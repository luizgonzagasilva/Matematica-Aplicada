function N = base_bspline(k, i, ti,t)
  if ( k==1 )
    if ( t>=ti(i) && t<ti(i+1) )
      N = 1;
    else
      N = 0;
    endif
  else
    N1 = (t-ti(i))*base_bspline(k-1, i, ti,t)/(ti(i+k-1)-ti(i));
    N2 = (ti(i+k)-t)*base_bspline(k-1, i+1, ti,t)/(ti(i+k)-ti(i+1));
    N = N1 + N2;
  endif 
