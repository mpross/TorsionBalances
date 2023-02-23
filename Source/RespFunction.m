w=2*pi*logspace(-2,0,1000);
w0=2*pi*1e-1;

Q1=1;
Q2=5;
Q3=10;
Q4=100;

R1=1./(1-w.^2/w0.^2-i/Q1);
R2=1./(1-w.^2/w0.^2-i/Q2);
R3=1./(1-w.^2/w0.^2-i/Q3);
R4=1./(1-w.^2/w0.^2-i/Q4);

fig1=figure(1)
subplot(2,1,1)
l=loglog(w/2/pi,abs(R1),w/2/pi,abs(R2),w/2/pi,abs(R3),w/2/pi,abs(R4))
ylabel('Magnitude','Interpreter', 'latex')
legend('Q=1','Q=5','Q=10','Q=100','Interpreter', 'latex')
set(gca,'FontSize',16);
set(l,'LineWidth',1.5);
grid on

subplot(2,1,2)
ll=semilogx(w/2/pi,angle(R1)*180/pi,w/2/pi,angle(R2)*180/pi,w/2/pi,angle(R3)*180/pi,w/2/pi,angle(R4)*180/pi)
xlabel('Frequency (Hz)','Interpreter', 'latex')
ylabel('Phase (deg)','Interpreter', 'latex')
set(gca,'FontSize',16);
set(ll,'LineWidth',1.5);
ylim([-10 190])
yticks(linspace(-180, 180, 9))
grid on

set(fig1,'Units','Inches');
pos = get(fig1,'Position');
set(fig1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(fig1,'ResponseFunction.pdf','-dpdf','-r1200')