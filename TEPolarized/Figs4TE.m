function Figs4TE

gn0    = -2.5;
xn0E02 = +1.5*0.8472;
k0a    = 0.1*(2*pi);

k0xmin    = -(2*pi);
k0xmax    = +(2*pi);
k0xpoints = 1020;
k0x1      = k0xmin + (k0xmax-k0xmin)*[0:k0xpoints]/k0xpoints;

k0ymin    = -(2*pi);
k0ymax    = +(2*pi);
k0ypoints = 1023;
k0y1      = k0ymin + (k0ymax-k0ymin)*[0:k0ypoints]/k0ypoints;

k0x2 = repmat(reshape(k0x1, [1, k0xpoints+1]), [k0ypoints+1, 1]);
k0y2 = repmat(reshape(k0y1, [k0ypoints+1, 1]), [1, k0xpoints+1]);
k0r2 = sqrt(k0x2.^2+k0y2.^2);
phi2 = atan2(k0y2, k0x2);

k0r2(k0r2<k0a) = NaN;

tauplus  = 0.3556;
tauminus = 0.3556;

F1     = (pi*k0a/16)*((besselj(0,k0a)-besselj(2,k0a))^2+(bessely(0,k0a)-bessely(2,k0a))^2);
Tminus = 1/(1+i*(F1/k0a^2)*(gn0*k0a^2+xn0E02*(2*tauplus+tauminus)));
Tplus  = 1/(1+i*(F1/k0a^2)*(gn0*k0a^2+xn0E02*(tauplus+2*tauminus)));
Rminus = (Tminus-1)*(besselh(0,2,k0a)-besselh(2,2,k0a))/(besselh(0,1,k0a)-besselh(2,1,k0a));
Rplus  =  (Tplus-1)*(besselh(0,2,k0a)-besselh(2,2,k0a))/(besselh(0,1,k0a)-besselh(2,1,k0a));

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


tauplus  = 0.7667;
tauminus = 0.0644;

F1     = (pi*k0a/16)*((besselj(0,k0a)-besselj(2,k0a))^2+(bessely(0,k0a)-bessely(2,k0a))^2);
Tminus = 1/(1+i*(F1/k0a^2)*(gn0*k0a^2+xn0E02*(2*tauplus+tauminus)));
Tplus  = 1/(1+i*(F1/k0a^2)*(gn0*k0a^2+xn0E02*(tauplus+2*tauminus)));
Rminus = (Tminus-1)*(besselh(0,2,k0a)-besselh(2,2,k0a))/(besselh(0,1,k0a)-besselh(2,1,k0a));
Rplus  =  (Tplus-1)*(besselh(0,2,k0a)-besselh(2,2,k0a))/(besselh(0,1,k0a)-besselh(2,1,k0a));

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