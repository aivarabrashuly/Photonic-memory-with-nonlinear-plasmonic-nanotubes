clear all

k0a = 0.05*2*pi;
gn0 = 0:0.5:20;
xn0E2 = -20:0.5:0;

n = zeros(length(gn0),length(xn0E2),1);

for k = 1:length(gn0)
    for j = 1:length(xn0E2)
        if (xn0E2(j) == 0)
            n(j,k,1) = 1;
        end
        sol = solcoef(k0a,gn0(k),xn0E2(j));
        
        n(k,j,1) = length(sol(1,:));
    end
    disp(k)
end

figure;
contourf(-xn0E2, gn0, n(:,:,1));
set(gca,'YDir','normal');
title('k_0a = 0.2. Number of solutions (\chi\eta_0|E_0|^2 and \gamma\eta_0).', 'fontsize', 20);
xlabel('\chi\eta_0|E_0|^2', 'fontsize', 20);
ylabel('\gamma\eta_0', 'fontsize', 20);