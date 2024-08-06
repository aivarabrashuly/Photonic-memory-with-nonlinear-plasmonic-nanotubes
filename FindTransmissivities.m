function [tauplus1, tauminus1] = FindTransmissivities(gn0, xn0E02, k0a)

taumin    = 0;
taumax    = 1;
taupoints = 1000;
tauplus   = taumin + (taumax-taumin)*[0:taupoints]/taupoints;

F1        = (pi*k0a/4)*abs(besselh(1,2,k0a))^2;
tauminusA = (-gn0/xn0E02-tauplus+sqrt((1-tauplus)./tauplus)/(F1*abs(xn0E02)))/2;
tauminusB = (-gn0/xn0E02-tauplus-sqrt((1-tauplus)./tauplus)/(F1*abs(xn0E02)))/2;
GA1       = (1+F1^2*(gn0+xn0E02*(2*tauplus+tauminusA)).^2).*tauminusA-1;
GB1       = (1+F1^2*(gn0+xn0E02*(2*tauplus+tauminusB)).^2).*tauminusB-1;

% figure;
% hold;
% plot(tauplus, GA1, '-b');
% plot(tauplus, GB1, '-r');

zerosposA  = find(diff(sign(GA1),1));
zerosposB  = find(diff(sign(GB1),1));
tauplusA1  = tauplus(zerosposA);
tauminusA1 = (-gn0/xn0E02-tauplusA1+sqrt((1-tauplusA1)./tauplusA1)/(F1*abs(xn0E02)))/2;
tauplusB1  = tauplus(zerosposB);
tauminusB1 = (-gn0/xn0E02-tauplusB1-sqrt((1-tauplusB1)./tauplusB1)/(F1*abs(xn0E02)))/2;
tauplus1   = [tauplusA1, tauplusB1];
tauminus1  = [tauminusA1, tauminusB1];