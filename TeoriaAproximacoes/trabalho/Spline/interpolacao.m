# le as imagens e armazena em suas respectiva variaveis em formato martical
noah22 = imread('Noah\noah22.png');
noah30 = imread('Noah\noah30.jpg');
noah39 = imread('Noah\noah39.png');
noah43 = imread('Noah\noah43.jpg');

size(noah22), size(noah30), size(noah39), size(noah43)

# padroniza o tamnaho das matrizes
noah22 = double(noah22(1:336,1:202,:));
noah30 = double(noah30(1:336,1:202,:));
noah39 = double(noah39(1:336,1:202,:));
noah43 = double(noah43(1:336,1:202,:));

size(noah22), size(noah30), size(noah39), size(noah43)

# spline
idade = 33;

for i = 1:size(noah22,1)
  for j = 1:size(noah22,2)
    for c = 1:size(noah22,3)
      xi = [22 30 39 43];
      yi = [noah22(i,j,c), noah30(i,j,c), noah39(i,j,c), noah43(i,j,c)];
      #s = cubic_spline(xi,yi,idade);
      s = spline(xi,yi,idade);
      mspline(i,j,c) = s;
    end
  end
  printf("%d / %d\n", i, size(noah22,1))
end
 
noah22 = uint8(noah22);
noah30 = uint8(noah30);
noah39 = uint8(noah39);
noah43 = uint8(noah43);
 
mspline = uint8(spline);
      
      
      

