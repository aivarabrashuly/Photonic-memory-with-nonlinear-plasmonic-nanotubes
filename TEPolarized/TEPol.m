function [PT, N] = TEPol(gn0, kn0E02, k0a)
F1  = (pi*k0a/16)*((besselj(0,k0a)-besselj(2,k0a))^2+(bessely(0,k0a)-bessely(2,k0a))^2);
T   = roots([F1^2*kn0E02^2/k0a^4, 2*F1^2*gn0*kn0E02/k0a^2,  1 + F1^2*gn0^2, -1]);
PT  = [isreal(T(1, 1)); isreal(T(2, 1)); isreal(T(3, 1))].*(real(T)>0).*(real(T)<1);
PT  = reshape(PT.*T, [1, 1, 3]);
N   = length(nonzeros(PT));
PT(PT==0) = NaN;