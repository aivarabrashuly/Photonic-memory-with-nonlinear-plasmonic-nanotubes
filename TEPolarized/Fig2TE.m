function Fig2TE

gn0 = -5;
kn0 = +10;

E0min    = 0.0000001;
E0max    = sqrt(2);
E0points = 100000;
E01      = E0min + (E0max-E0min)*[0:E0points]/E0points;

k0a = 0.15*(2*pi);
for E0index = 0:E0points
    E0      = E0min + (E0max-E0min)*E0index/E0points;
    [PTD(E0index+1, :), N(E0index+1, :)] = TEPol(gn0, kn0*E0^2, k0a);
end


figure;
hold;
plot(E01.^2, PTD(:, 1), '-b','LineWidth', 3);
plot(E01.^2, PTD(:, 2), '-r','LineWidth', 3);
plot(E01.^2, PTD(:, 3), '-b','LineWidth', 3);
xlabel('$E_0^2$ (V/m)$^2$', 'interpreter', 'latex');
ylabel('$\tau$', 'interpreter', 'latex');
set(gca, 'FontName', 'Times New Roman','fontsize', 16);
ylim([0, 1]);