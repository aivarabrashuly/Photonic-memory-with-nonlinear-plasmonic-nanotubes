function Fig12b

gn0 = -10;
kn0 = +20;

E0min    = 0.0000001;
E0max    = sqrt(2);
E0points = 100000;
E01      = E0min + (E0max-E0min)*[0:E0points]/E0points;

k0a = 0.01*(2*pi);
for E0index = 0:E0points
    E0      = E0min + (E0max-E0min)*E0index/E0points;
    [PTA(E0index+1, :), N(E0index+1, :)] = TausOmni(gn0, kn0*E0^2, k0a);
end

k0a = 0.03*(2*pi);
for E0index = 0:E0points
    E0      = E0min + (E0max-E0min)*E0index/E0points;
    [PTB(E0index+1, :), N(E0index+1, :)] = TausOmni(gn0, kn0*E0^2, k0a);
end

k0a = 0.06*(2*pi);
for E0index = 0:E0points
    E0      = E0min + (E0max-E0min)*E0index/E0points;
    [PTC(E0index+1, :), N(E0index+1, :)] = TausOmni(gn0, kn0*E0^2, k0a);
end

k0a = 0.1*(2*pi);
for E0index = 0:E0points
    E0      = E0min + (E0max-E0min)*E0index/E0points;
    [PTD(E0index+1, :), N(E0index+1, :)] = TausOmni(gn0, kn0*E0^2, k0a);
end


figure;
hold;
plot(E01.^2, PTA(:, 1), '-b','LineWidth', 3);
plot(E01.^2, PTB(:, 1), '-b','LineWidth', 2);
plot(E01.^2, PTC(:, 1), '-b','LineWidth', 1);
plot(E01.^2, PTD(:, 1), '-b','LineWidth', 0.5);
plot(E01.^2, PTA(:, 2), '-r','LineWidth', 3);
plot(E01.^2, PTA(:, 3), '-b','LineWidth', 3);
plot(E01.^2, PTB(:, 2), '-r','LineWidth', 2);
plot(E01.^2, PTB(:, 3), '-b','LineWidth', 2);
plot(E01.^2, PTC(:, 2), '-r','LineWidth', 1);
plot(E01.^2, PTC(:, 3), '-b','LineWidth', 1);
plot(E01.^2, PTD(:, 2), '-r','LineWidth', 0.5);
plot(E01.^2, PTD(:, 3), '-b','LineWidth', 0.5);
xlabel('$E_0^2$ (V/m)$^2$', 'interpreter', 'latex');
ylabel('$\tau$', 'interpreter', 'latex');
legend({'$a=0.01\lambda$', '$a=0.03\lambda$', '$a=0.06\lambda$', '$a=0.10\lambda$'}, 'interpreter', 'latex');
set(gca, 'FontName', 'Times New Roman','fontsize', 16);
ylim([0, 1]);
