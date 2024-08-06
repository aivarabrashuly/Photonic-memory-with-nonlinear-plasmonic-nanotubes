function Fig23b

gn0 = -10;
kn0 = +15;

E0min    = sqrt(0.00001);
E0max    = sqrt(6);
E0points = 68000;
E01      = E0min + (E0max-E0min)*[0:E0points]/E0points;

k0a = 0.05*(2*pi);
for E0index = 0:E0points
    E0      = E0min + (E0max-E0min)*E0index/E0points;
    [tauplus1(E0index+1, :), tauminus1(E0index+1, :)] =...
        FindTransmissivities2(gn0, kn0*E0^2, k0a);
end

figure;
hold;
plot(E01.^2, tauplus1, 'ob', 'MarkerSize', 1, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
xlabel('$E_0^2$ (V/m)$^2$', 'interpreter', 'latex');
ylabel('$\tau_{+}$', 'interpreter', 'latex');
set(gca, 'FontName', 'Times New Roman','fontsize', 16);
ylim([0, 1]);

figure;
hold;
plot(E01.^2, tauminus1, 'ob', 'MarkerSize', 1, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
xlabel('$E_0^2$ (V/m)$^2$', 'interpreter', 'latex');
ylabel('$\tau_{-}$', 'interpreter', 'latex');
set(gca, 'FontName', 'Times New Roman','fontsize', 16);
ylim([0, 1]);
xlim([0, 10]);