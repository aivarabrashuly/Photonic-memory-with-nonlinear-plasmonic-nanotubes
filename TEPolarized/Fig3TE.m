function Fig3TE

gn0 = -5;
kn0 = +3.5;

E0min    = 0.0000001;
E0max    = sqrt(2.5);
E0points = 80000;
E01      = E0min + (E0max-E0min)*[0:E0points]/E0points;

k0a = 0.15*(2*pi);
for E0index = 0:E0points
    E0      = E0min + (E0max-E0min)*E0index/E0points;
%     [BufPlus, BufMinus] = FindTransmissivities2(gn0, kn0*E0^2, k0a)
    [tauplus1(E0index+1, :), tauminus1(E0index+1, :)] = FindTransmissivities2TE(gn0, kn0*E0^2, k0a);
end

figure;
hold;
plot(E01.^2, tauplus1, 'ob', 'MarkerSize', 3, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
xlabel('$E_0^2$ (V/m)$^2$', 'interpreter', 'latex');
ylabel('$\tau_{+}$', 'interpreter', 'latex');
set(gca, 'FontName', 'Times New Roman','fontsize', 16);
ylim([0, 1]);