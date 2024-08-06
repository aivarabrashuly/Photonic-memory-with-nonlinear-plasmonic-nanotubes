function X = solcoef(k0a,gn0,xn0E2)
    

    function F = rootsofX(x)
        
        F(1)=-1+((-x-gn0./xn0E2+(4.*(-1+x))./(pi.*sqrt(-(k0a.^2.*(-1+x).*x.*xn0E2.^2.* ...
                (besselj(1,k0a).^2+bessely(1,k0a).^2).^2)))).*(1+(k0a.^2.*pi.^2.* ...
                (besselj(1,k0a).^2+bessely(1,k0a).^2).^2* ... 
                (gn0+3.*x.*xn0E2+(4.*(-1+x).*xn0E2)./(pi.*sqrt(-(k0a.^2.*(-1+x) ...
                .*x.*xn0E2.^2.*(besselj(1,k0a).^2+bessely(1,k0a).^2).^2)))).^2)./64))./2;

        F(2)=-1+((-x-gn0./xn0E2-(4.*(-1+x))./(pi.*sqrt(-(k0a.^2.*(-1+x).*x.*xn0E2.^2.* ...
                (besselj(1,k0a).^2+bessely(1,k0a).^2).^2)))).*(1+(k0a.^2.*pi.^2.* ...
                (besselj(1,k0a).^2+bessely(1,k0a).^2).^2.* ...
                (gn0+3.*x.*xn0E2-(4.*(-1+x).*xn0E2)./(pi.*sqrt(-(k0a.^2.*(-1+x) ...
                .*x.*xn0E2.^2.*(besselj(1,k0a).^2+bessely(1,k0a).^2).^2)))).^2)./64))./2;
    end

    function Y = rootsofY(x)
        Y(1)=(-x-gn0./xn0E2+(4.*(-1+x))./(pi.*sqrt(-(k0a.^2.*(-1+x).*x.*xn0E2.^2.* ...
            (besselj(1,k0a).^2+bessely(1,k0a).^2).^2))))./2;
        
        Y(2)=(-x-gn0./xn0E2-(4.*(-1+x))./(pi.*sqrt(-(k0a.^2.*(-1+x).*x.*xn0E2.^2.* ...
            (besselj(1,k0a).^2+bessely(1,k0a).^2).^2))))./2;
    end 

    x = linspace(0, 1, 10001);
    y = zeros(2,length(x));
    for k = 1:length(x)
        y(:,k) = rootsofX(x(k));
    end
    
    Xroots = [];
    k = [];
    for i = 1:10000
        if y(1,i)*y(1,i+1) < 0
            xroot = x(i) - (x(i+1) - x(i))/(y(1,i+1) - y(1,i))*y(1,i);
            Xroots = [Xroots; xroot];
            k = [k; 1];
        elseif y(2,i)*y(2,i+1) < 0 
            xroot = x(i) - (x(i+1) - x(i))/(y(2,i+1) - y(2,i))*y(2,i);
            Xroots = [Xroots; xroot];
            k = [k; 2];
        end
    end
    
    Yroots = [];
    
    for j = 1:length(Xroots)
        yroot = rootsofY(Xroots(j));
        if k(j) == 1
            if yroot(1) > 0 && yroot(1) < 1
                Yroots = [Yroots; yroot(1)];
            end
        elseif k(j) == 2
            if yroot(2) > 0 && yroot(2) < 1
                Yroots = [Yroots; yroot(2)];
            end
        else
            Yroots = [Yroots; NaN];
        end
    end
    
    X = NaN(2,length(Xroots));
    X(1,:) = Xroots; 
    X(2,:) = Yroots;
end