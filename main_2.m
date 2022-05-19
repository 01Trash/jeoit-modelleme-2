clc,clear
pkg load io

##########################
%%% 2. soru başlangıç
##########################

%%% Verileri çek
filename = 'BLh.csv';
data_source = csvread(filename);

%GRS 80 parametreleri
a = 6378137.00000;
b = 6356752.31414;
ro_D = 180/pi; %radyandan dereceye
ro_R = pi/180;  %dereceden radyana

% B, L koordinatlar
%B1= 38.559797999749485; %derece  %38 derece 33 dk 35.27 sn
%L1= 40.228214999594805; %derece  %40 derece 13 dk 41.57 sn
%L0=39;    %DOM
%dL1=L1-L0; %derece

[m n] = size(data_source);
for i=1:m;
    k=1:n;

    B1 = data_source(i,1);
    L1 = data_source(i,2);

    L0 = 39;    %DOM
    dL1 = L1 - L0; %derece

    B = B1 * ro_R; %radyan
    L = L1 * ro_R; %radyan
    dL = dL1 * ro_R; %radyan

    t = tan(B);
    bn = (a-b)/(a+b);
    nu = (a*a-b*b)/b/b*cos(B)*cos(B);  %((a^2-b^2)*(cos(B))^2)/b^2;
    N = (a*a)/b/sqrt(1.+nu);
    b1 = (a+b)*((1/2)+((bn^2)/8)+((bn^4)/128));
    b2 = ((-3*bn)/2)+((9*bn^3)/16)-((3*bn^5)/32);
    b3 = ((15*bn^2)/16)-((15*bn^4)/32);
    b4 = ((-35*bn^3)/48)+((105*bn^5)/256);
    b5 = ((315*bn^4)/512);

    x = b1*(B+b2*sin(2.*B)+b3*sin(4.*B)+b4*sin(6.*B)+b5*sin(8.*B)) ...
+ t*N*( (dL*cos(B))^2/2. ...
+ (dL*cos(B))^4 * ( 5. -t^2 + 9.*nu
+4.*nu^2)/24. ...
+ (dL*cos(B))^6 * ( 61. -58.*t^2 + t^4 +270.*nu -
330.*nu*t^2)/720. ...
+ (dL*cos(B))^8 * (1385. -3111.*t^2 + 543.*t^4 -t^6)/40320. ...
);

    y1 =  N*( dL*cos(B) ...
+ (dL*cos(B))^3 * ( 1. -t^2 + nu)/6.+...
+ (dL*cos(B))^5 * ( 5. -18.*t^2 + t^4 + 14.*nu -
58.*t^2*nu)/120. ...
+ (dL*cos(B))^7 * ( 61. -479.*t^2 + 179.*t^4 -t^6 )/5040. ...
);;

    y = y1 + 500000;

    M(i,1) = x;
    M(i,2) = y;

    i = i+1;
    k = k+1;
end

%fprintf("X: %4.13f \nY: %4.13f \n", x, y);

%%% M dosyasını dosyaya yazdır
%M
%xlswrite('abc.xlsx', M);
csvwrite('xy.csv', M);

##########################
%%% 2. soru bitiş
##########################
