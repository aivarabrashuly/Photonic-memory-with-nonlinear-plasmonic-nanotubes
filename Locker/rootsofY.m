function Y = rootsofY(x)

k0a = 0.05;
gn0 = 0.7;
xn0E2 = -0.3;

        Y(1)=(-x-gn0./xn0E2+(4.*(-1+x))./(pi.*sqrt(-(k0a.^2.*(-1+x).*x.*xn0E2.^2.* ...
            (besselj(1,k0a).^2+bessely(1,k0a).^2).^2))))./2;
        
        Y(2)=(-x-gn0./xn0E2-(4.*(-1+x))./(pi.*sqrt(-(k0a.^2.*(-1+x).*x.*xn0E2.^2.* ...
            (besselj(1,k0a).^2+bessely(1,k0a).^2).^2))))./2;
end 