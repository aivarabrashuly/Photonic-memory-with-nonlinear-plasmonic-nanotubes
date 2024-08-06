k0a = 0.1;
gn0 = 0.8;
xn0E2 = -1:0.005:0;

r = NaN(2, 9, length(xn0E2));    % r - |T|^2

for i = 1:length(xn0E2)
    sol = solcoef(k0a,gn0,xn0E2(i));
    
    j = length(sol(1,:));
    
    r(1,1:j,i) = sol(1,:);
    r(2,1:j,i) = sol(2,:);
end


figure;
scatter(abs(xn0E2), r(1,1,:), 'k');
hold on
for i = 1:8
    scatter(abs(xn0E2), r(1,i+1,:), 'k');
end
title('k_0a=0.1, \gamma\eta_0=1.4', 'fontsize', 20);
xlabel('-\chi\eta_0E_0^2', 'fontsize', 20);
ylabel('|T_1|^2 or |T_{-1}|^2', 'fontsize', 20);

% figure;
% scatter(abs(xn0E2), real(coef(1,1,:)), 'k');
% hold on
% for i = 1:8
%     scatter(abs(xn0E2), real(coef(1,i+1,:)), 'k');
% end
% 
% figure;
% scatter(abs(xn0E2), imag(coef(1,1,:)), 'k');
% hold on
% for i = 1:8
%     scatter(abs(xn0E2), imag(coef(1,i+1,:)), 'k');
% end