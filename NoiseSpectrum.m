w=2*pi*logspace(-2,0,1000);
w0=2*pi*1e-1;

Q=1e6;
kB=1.38064852*10^-23;
T=293;

R=1./(1-w.^2/w0.^2-i/Q);

theta=1e-9+0*w;
kappa=1e-8;
torq=abs(kappa.*theta./R)

thermal=sqrt(4*kB*T*kappa./(Q.*w));

fig1=figure(1)
subplot(2,1,1)
l=loglog(w/2/pi,torq, w/2/pi,thermal)
ylabel('Torque ($N\ m/\sqrt{Hz}$)','Interpreter', 'latex')
xlabel('Frequency (Hz)','Interpreter', 'latex')
legend('Readout Noise','Thermal Noise','Interpreter', 'latex')
set(gca,'FontSize',16);
set(l,'LineWidth',1.5);
xlim([1e-2 1e0])
ylim([1e-19 1e-15])
grid on

subplot(2,1,2)
l=loglog(w/2/pi,abs(torq.*R/kappa), w/2/pi,abs(thermal.*R/kappa))
ylabel('Angle ($rad/\sqrt{Hz}$)','Interpreter', 'latex')
xlabel('Frequency (Hz)','Interpreter', 'latex')
legend('Readout Noise','Thermal Noise','Interpreter', 'latex')
set(gca,'FontSize',16);
set(l,'LineWidth',1.5);
xlim([1e-2 1e0])
ylim([1e-11 1e-6])
grid on

set(fig1,'Units','Inches');
pos = get(fig1,'Position');
set(fig1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(fig1,'NoiseSpectrum.pdf','-dpdf','-r1200')