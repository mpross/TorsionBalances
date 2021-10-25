alpha = linspace(0,90,180)*pi/180;
day = 86400.002;
omega = 2*pi/day;
R = 6.3781e6;
g = 9.81;

phi = atan(omega^2*R*cos(alpha).*sin(alpha)./(g-omega^2*R*cos(alpha).^2));

fig1=figure(1)
l=plot(alpha*180/pi, phi*1e3)
xlabel('Latitude (deg)','Interpreter', 'latex')
ylabel('Swing Equilibrium Angle (mrad)','Interpreter', 'latex')
set(gca,'FontSize',16);
set(l,'LineWidth',1.5);
grid on

set(fig1,'Units','Inches');
pos = get(fig1,'Position');
set(fig1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(fig1,'CentrifugalPlot.pdf','-dpdf','-r1200')