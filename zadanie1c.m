run('initProjekt2')

danUczX=x(1:2:end);
danWerX=x(2:2:end);
danUczY=y(1:2:end);
danWerY=y(2:2:end);

M=[ones([length(danUczX), 1]), danUczX];

w=M\danUczY;

u=[-1:1/99:1]';
mod=w(1)+danUczX.*w(2);
lm=length(mod);

plot([1: lm], mod)

hold on

plot([1:lm], danUczY)

hold off




eUcz=mod-danUczY;

Eu1=0;
for i=1:length(eUcz)
    Eu1=Eu1+(eUcz(i)-danUczY(i))^2;
end

%błąd uczących

Eu1

% dane weryfikujące

mod=w(1)+danWerX.*w(2);

lm=length(mod)

figure

plot([1:lm], mod)

figure

plot([1:lm], mod)

hold on

plot([1:lm], danWerY)

hold off

eWer=mod-danWerY;


Ew1=0;
for i=1:length(eWer)
    Ew1=Ew1+(eWer(i)-danWerY(i))^2;
end

% błąd weryfikujących

Ew1