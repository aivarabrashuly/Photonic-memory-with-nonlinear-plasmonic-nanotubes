function Fig1TE

k0a = 0.15*2*pi;

gn0min         = -20;
gn0max         = 20.000034243542;
gn0points      = 999;
gn01           = gn0min + (gn0max-gn0min)*[0:gn0points]/gn0points;

x2n0E02min     = -20.000023425;
x2n0E02max     = +20;
x2n0E02points  = 998;
x2n0E021       = x2n0E02min + (x2n0E02max-x2n0E02min)*[0:x2n0E02points]/x2n0E02points;

for gn0index = 0:gn0points
    gn0     = gn0min + (gn0max-gn0min)*gn0index/gn0points;
    for x2n0E02index = 0:x2n0E02points
        x2n0E02 = x2n0E02min + (x2n0E02max-x2n0E02min)*x2n0E02index/x2n0E02points;
        [~, N2(x2n0E02index+1, gn0index+1)]= TEPol(gn0, x2n0E02, k0a);
    end
end

figure;
contourf(gn01, x2n0E021, N2);
xlabel('$\gamma\eta_0$', 'interpreter', 'latex');
ylabel('$\kappa\eta_0E_0^2$', 'interpreter', 'latex');
xlim([gn0min,gn0max]);
ylim([x2n0E02min,x2n0E02max]);
set(gca, 'fontsize', 16, 'fontname', 'times');
colormap('jet');
text(10, -15, '3', 'fontsize', 50, 'fontname', 'times', 'color', 'w');
text(-12, 15, '3', 'fontsize', 50, 'fontname', 'times', 'color', 'w');
text(0, 0, '1', 'fontsize', 50, 'fontname', 'times', 'color', 'w');