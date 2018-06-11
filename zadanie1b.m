run('initProjekt2')

danUczX=x(1:2:end);
danWerX=x(2:2:end);
danUczY=y(1:2:end);
danWerY=y(2:2:end);


lu=length(danUczX);
plot([1: lu], danUczX)
xlabel('dane uczace U')
figure
plot([1: lu], danUczY)
xlabel('dane uczace Y')


lw=length(danWerX);
figure
plot([1: lu], danWerX)
xlabel('dane weryfikujace U')
figure
plot([1: lu], danWerY)
xlabel('dane weryfikujace Y')