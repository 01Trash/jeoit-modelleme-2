clc,clear
pkg load io

##########################
%%% 1. soru başlangıç
##########################

%%% Verileri çek
filename = 'XYZ_ort.ods';
data_source = xlsread(filename);

%%% GRS80 elipsoid parametreleri
a = 6378137.00000;
b = 6356752.31414;
ro_D = 180/pi;

[m,n] = size(data_source);
for i = 1:m;
    k = 1:n;
    X = data_source(i,1);
    Y = data_source(i,2);
    Z = data_source(i,3);


    %%% Hocanın yazdığı fonksiyon
    [B,L,h] = XYZ_BLh(a, b, X, Y, Z);

    %fprintf("\n  B=%8.4f    L=%8.4f    h=%8.4f", B*ro_D, L*ro_D, h);

    M(i,1) = B * ro_D;
    M(i,2) = L * ro_D;
    M(i,3) = h;

    i = i + 1;
    k = k + 1;
end;
%M(1,1) = 1;
%M(1,2) = 2;
%M(1,3) = 3;
%%% M dosyasını dosyaya yazdır
%M
%xlswrite('abc.xlsx', M);
csvwrite('BLh.csv', M);

##########################
%%% 1. soru bitiş
##########################



##########################
%%% 3. soru başlangıç
##########################








##########################
%%% 3. soru bitiş
##########################
##########################
%%% 4. soru başlangıç
##########################








##########################
%%% 4. soru bitiş
##########################
##########################
%%% 5. soru başlangıç
##########################








##########################
%%% 5. soru bitiş
##########################

%figure (); plot (M);
%figure (); stem (M);







