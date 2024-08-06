function [tauplus1, tauminus1, GA1, GB1, tauplus] = FindTransmissivities3(gn0, xn0E02, k0a)

taumin    = 0.001;
taumax    = 1;
taupoints = 100000;
tauplus   = taumin + (taumax-taumin)*[0:taupoints]/taupoints;

F1        = (pi*k0a/4)*abs(besselh(1,2,k0a))^2;
tauminusA = (-gn0/xn0E02-tauplus+sqrt((1-tauplus)./tauplus)/(F1*abs(xn0E02)))/2;
tauminusB = (-gn0/xn0E02-tauplus-sqrt((1-tauplus)./tauplus)/(F1*abs(xn0E02)))/2;
GA1       = (1+F1^2*(gn0+xn0E02*(2*tauplus+tauminusA)).^2).*tauminusA-1;
GB1       = (1+F1^2*(gn0+xn0E02*(2*tauplus+tauminusB)).^2).*tauminusB-1;

zerosposA  = find(diff(sign(GA1),1));
zerosposB  = find(diff(sign(GB1),1));
tauplusA1  = tauplus(zerosposA);
tauminusA1 = (-gn0/xn0E02-tauplusA1+sqrt((1-tauplusA1)./tauplusA1)/(F1*abs(xn0E02)))/2;
tauplusB1  = tauplus(zerosposB);
tauminusB1 = (-gn0/xn0E02-tauplusB1-sqrt((1-tauplusB1)./tauplusB1)/(F1*abs(xn0E02)))/2;
tauplus1   = [tauplusA1, tauplusB1];
tauminus1  = [tauminusA1, tauminusB1];

T         = length(tauplus1);
tauplus1  = [tauplus1,  NaN*ones(1, 9-T)];
tauminus1 = [tauminus1, NaN*ones(1, 9-T)];