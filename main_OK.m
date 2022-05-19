% HRT432 Geoid Modellig, Kocaeli University, Geodesy Division, Turkey
% O.KURT, orhan.kurt@kocaeli.edu.tr
% Main routine for ploting the surfaces (local geoid and elipsoid)
function main_OK();
   %clc ;


   %_____________________________
   #HRT432_OK();

   clc,clear
   format long

   %_____________________________
   ro_D =   180./pi ;
   a    = 6378137.00000 ;
   b    = 6356752.31414;
   L0   = 39./ro_D ;    %Kendi DOM degerinizi girin!!!

   x1 = 4222180.070269220000000; %yukari
   y1 =  368618.282385542000000-500000.;   %saga-500000 yapmayi unutmayin!!!


   [ B , L ] = xy_BL(a,b, L0, x1,y1 );
   printf('\n   B = %12.8f      L = %12.8f\n', B*ro_D, L*ro_D );


endfunction
