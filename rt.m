function rt

% k0a = 0.15*2*pi; % about k0a = 0.9

gn0    =  -10;

k0amin         = 0.05*2*pi;
k0amax         = 0.15*2*pi;
k0apoints      = 999;
k0a1           = k0amin + (k0amax-k0amin)*[0:k0apoints]/k0apoints;

x2n0E02min     = -0.000000001;
x2n0E02max     = 20.000023425;
x2n0E02points  = 999;
x2n0E021       = x2n0E02min + (x2n0E02max-x2n0E02min)*[0:x2n0E02points]/x2n0E02points;

for k0aindex = 0:k0apoints
    k0a     = k0amin + (k0amax-k0amin)*k0aindex/k0apoints;
    for x2n0E02index = 0:x2n0E02points
        x2n0E02 = x2n0E02min + (x2n0E02max-x2n0E02min)*x2n0E02index/x2n0E02points;
        [tauplus1, tauminus1] = FindTransmissivities(gn0, x2n0E02, k0a);
        N2(x2n0E02index+1, k0aindex+1) = length(tauplus1);
    end
end

figure;
contourf(k0a1, x2n0E021, N2);
xlabel('$k_0a$', 'interpreter', 'latex');
ylabel('$\kappa\eta_0E_0^2$', 'interpreter', 'latex');
xlim([k0amin,k0amax]);
ylim([x2n0E02min,x2n0E02max]);
set(gca, 'fontsize', 16, 'fontname', 'times');
colormap('jet');
text(13, -2,  '1', 'fontsize', 40, 'fontname', 'times', 'color', 'w');
text(5,  -12, '3', 'fontsize', 40, 'fontname', 'times', 'color', 'w');
text(15, -10, '5', 'fontsize', 40, 'fontname', 'times', 'color', 'k');
text(19, -17.5, '7', 'fontsize', 20, 'fontname', 'times', 'color', 'k');
text(14, -17, '9', 'fontsize', 40, 'fontname', 'times', 'color', 'w');