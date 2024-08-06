function Figs5

gn0    = -1.5;
xn0E02 = +3.5*0.18;
k0a    = 0.015*(2*pi);

k0xmin    = -0.25*(2*pi);
k0xmax    = +0.25*(2*pi);
k0xpoints = 1020;
k0x1      = k0xmin + (k0xmax-k0xmin)*[0:k0xpoints]/k0xpoints;

k0ymin    = -0.25*(2*pi);
k0ymax    = +0.25*(2*pi);
k0ypoints = 1023;
k0y1      = k0ymin + (k0ymax-k0ymin)*[0:k0ypoints]/k0ypoints;

k0x2 = repmat(reshape(k0x1, [1, k0xpoints+1]), [k0ypoints+1, 1]);
k0y2 = repmat(reshape(k0y1, [k0ypoints+1, 1]), [1, k0xpoints+1]);
k0r2 = sqrt(k0x2.^2+k0y2.^2);
phi2 = atan2(k0y2, k0x2);

k0r2(k0r2<k0a) = NaN;

tauplus  = 0.9999;
tauminus = 0.6887;

F1     = (pi*k0a/4)*abs(besselh(1,2,k0a))^2;
Tminus = 1/(1-i*F1*(gn0+xn0E02*(2*tauplus+tauminus)));
Tplus  = 1/(1-i*F1*(gn0+xn0E02*(tauplus+2*tauminus)));
Rminus = (Tminus-1)*besselh(1,2,k0a)/besselh(1,1,k0a);
Rplus  =  (Tplus-1)*besselh(1,2,k0a)/besselh(1,1,k0a);

Ez2 =  Tplus.*exp(+i*phi2).*besselh(1,2,k0r2)./besselh(1,2,k0a)+...
      Tminus.*exp(-i*phi2).*besselh(1,2,k0r2)./besselh(1,2,k0a);

figure;
contourf(k0x1/(2*pi), k0y1/(2*pi), abs(Ez2));
xlabel('$x/\lambda$', 'interpreter', 'latex');
ylabel('$y/\lambda$', 'interpreter', 'latex'); 
set(gca, 'fontsize', 16, 'fontname', 'times');
colormap('jet');
colorbar;
caxis([0, 1]);
xlim([k0xmin, k0xmax]/(2*pi));
ylim([k0ymin, k0ymax]/(2*pi));




gn0    = -1.5;
xn0E02 = +3.5*0.39;
k0a    = 0.015*(2*pi);

k0xmin    = -0.25*(2*pi);
k0xmax    = +0.25*(2*pi);
k0xpoints = 1020;
k0x1      = k0xmin + (k0xmax-k0xmin)*[0:k0xpoints]/k0xpoints;

k0ymin    = -0.25*(2*pi);
k0ymax    = +0.25*(2*pi);
k0ypoints = 1023;
k0y1      = k0ymin + (k0ymax-k0ymin)*[0:k0ypoints]/k0ypoints;

k0x2 = repmat(reshape(k0x1, [1, k0xpoints+1]), [k0ypoints+1, 1]);
k0y2 = repmat(reshape(k0y1, [k0ypoints+1, 1]), [1, k0xpoints+1]);
k0r2 = sqrt(k0x2.^2+k0y2.^2);
phi2 = atan2(k0y2, k0x2);

k0r2(k0r2<k0a) = NaN;

tauplus  = 0.9995;
tauminus = 0.0474;

F1     = (pi*k0a/4)*abs(besselh(1,2,k0a))^2;
Tminus = 1/(1-i*F1*(gn0+xn0E02*(2*tauplus+tauminus)));
Tplus  = 1/(1-i*F1*(gn0+xn0E02*(tauplus+2*tauminus)));
Rminus = (Tminus-1)*besselh(1,2,k0a)/besselh(1,1,k0a);
Rplus  =  (Tplus-1)*besselh(1,2,k0a)/besselh(1,1,k0a);

Ez2 =  Tplus.*exp(+i*phi2).*besselh(1,2,k0r2)./besselh(1,2,k0a)+...
      Tminus.*exp(-i*phi2).*besselh(1,2,k0r2)./besselh(1,2,k0a);

figure;
contourf(k0x1/(2*pi), k0y1/(2*pi), abs(Ez2));
xlabel('$x/\lambda$', 'interpreter', 'latex');
ylabel('$y/\lambda$', 'interpreter', 'latex'); 
set(gca, 'fontsize', 16, 'fontname', 'times');
colormap('jet');
colorbar;
caxis([0, 1]);
xlim([k0xmin, k0xmax]/(2*pi));
ylim([k0ymin, k0ymax]/(2*pi));



