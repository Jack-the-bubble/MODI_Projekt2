format long
ducz=importdata('Dane/danedynucz37.txt');

xdynu=ducz(1:end, 1);
ydynu=ducz(1:end, 2);
length(xdynu)
length(ydynu)
% plot(xdynu, ydynu)
plot([1:length(xdynu)], xdynu)
xlabel('dane dynamiczne uczące u')
figure
plot([1:length(ydynu)], ydynu)
xlabel('dane dynamiczne uczące')


dwer=importdata('Dane/danedynwer37.txt');


xdynw=dwer(1:end, 1);
ydynw=dwer(1:end, 2);
length(xdynw)
length(ydynw)
% plot(xdynu, ydynu)
figure
plot([1:length(xdynw)], xdynw)
figure
plot([1:length(ydynw)], ydynw)
xlabel('dane dynamiczne weryfikujące')