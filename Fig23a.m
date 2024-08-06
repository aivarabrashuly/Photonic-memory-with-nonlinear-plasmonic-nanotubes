function Fig23a

gn0    = -10;
kn0E02 = +15*0.237;
k0a    = 0.05*(2*pi);

gn0    = -1.5;
kn0E02 = +3.5*0.6216;
k0a    = 0.015*(2*pi);

gn0    = -1.5;
kn0E02 = +3.5*0.18;
k0a    = 0.015*(2*pi);

[tauplus1, tauminus1] =...
    FindTransmissivities2(gn0, kn0E02, k0a)

[tauplus1, tauminus1, GA1, GB1, tauplus] =...
    FindTransmissivities3(gn0, kn0E02, k0a);

disp(tauplus1);

disp(tauminus1);

figure;
hold;
plot(tauplus, abs(GA1), '-', 'linewidth', 2, 'Color',[0,0.5,0]);
plot(tauplus, abs(GB1), '-r', 'linewidth', 2);
set(gca, 'YScale', 'log');
set(gca, 'XScale', 'log');
xlim([0.001, 1]);
ylim([0.0001, 100]);
xlabel('$\tau_{+}$', 'interpreter', 'latex');
set(gca, 'FontName', 'Times New Roman','fontsize', 16);
legend({'$\tau_{-}=\tau_{-}^A$', '$\tau_{-}=\tau_{-}^B$'}, 'interpreter', 'latex');