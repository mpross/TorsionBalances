w=2*pi*logspace(-2,0,1000);
w0=2*pi*1e-1;

Q=10;

R=1./(1-w.^2/w0.^2-i/Q);

theta=1e-9+0*w;
kappa=1e-8;
torq=abs(kappa.*theta./R)

fig1=figure(1)
l=loglog(w/2/pi,torq)
ylabel('Torque ($N\ m/\sqrt{Hz}$)','Interpreter', 'latex')
xlabel('Frequency (Hz)','Interpreter', 'latex')
set(gca,'FontSize',16);
set(l,'LineWidth',1.5);
grid on

set(fig1,'Units','Inches');
pos = get(fig1,'Position');
set(fig1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(fig1,'TorqueSpectrum.pdf','-dpdf','-r1200')