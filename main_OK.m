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
   L0   = 42./ro_D ;    %Kendi DOM degerinizi girin!!!

   x1 = 4276262.4741; %yukari
   y1 =  383909.0426-500000.;   %saga-500000 yapmayi unutmayin!!!
   
   
   [ B , L ] = xy_BL(a,b, L0, x1,y1 );
   printf('\n   B = %12.8f      L = %12.8f\n', B*ro_D, L*ro_D );
   
   printf('\n  x1 = %12.6f     y1 = %12.6f\n', x1, y1 );
   [ x , y ] = BL_xy(a,b, L0, B,L );
   printf('\n   x = %12.6f      y = %12.6f\n', x, y );
   
endfunction