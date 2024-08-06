function [PT, N] = TausOmni(gn0, kn0E02, k0a)
F0  = (k0a*pi*(J(0, k0a)^2 + Y(0, k0a)^2))/4;
T   = roots([F0^2*kn0E02^2, 2*F0^2*gn0*kn0E02,  1 + F0^2*gn0^2, -1]);
PT  = [isreal(T(1, 1)); isreal(T(2, 1)); isreal(T(3, 1))].*(real(T)>0).*(real(T)<1);
PT  = reshape(PT.*T, [1, 1, 3]);
N   = length(nonzeros(PT));
PT(PT==0) = NaN;

function [out] = J(n,z)
out = besselj(n,z);

function [out] = Y(n,z)
out = bessely(n,z);