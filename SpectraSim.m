N=2000;
t = linspace(0,1000,N);
n = randn(1,N);
x = 3*sin(2*pi*1/10*t)+n;

[A, F] = asd2(x, 1000/N, 1, 1, @hann);

fig1=figure(1);
l=plot(t,x);
xlabel('Time (s)','Interpreter', 'latex')
ylabel('x (m)','Interpreter', 'latex')
set(l,'LineWidth',1.5);
set(gca,'FontSize',16);
set(l,'MarkerSize',16);
grid on

fig2=figure(2);
l=loglog(F,A);
xlabel('Frequency (Hz)','Interpreter', 'latex')
ylabel('ASD ($m/\sqrt{Hz}$)','Interpreter', 'latex')
set(l,'LineWidth',1.5);
set(gca,'FontSize',16);
set(l,'MarkerSize',16);
xlim([1e-2,1])
grid on


set(fig1,'Units','Inches');
pos = get(fig1,'Position');
set(fig1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(fig1,'SpecTime.pdf','-dpdf','-r1200')

set(fig2,'Units','Inches');
pos = get(fig2,'Position');
set(fig2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(fig2,'SpecASD.pdf','-dpdf','-r1200')