format long
ducz=importdata('Dane/danedynucz37.txt');
xdynu=ducz(1:end, 1);
ydynu=ducz(1:end, 2);

dwer=importdata('Dane/danedynwer37.txt');
xdynw=dwer(1:end, 1);
ydynw=dwer(1:end, 2);

n=3;

M=zeros(length(xdynu)-n, n*2);
for i=1 : length(xdynu)-n
    for a = 1 : n
        M(i, n+1-a)=xdynu(i+a-1);
        M(i, 2*n+1-a)=ydynu(i+a-1);
    end
end

Y=ydynu(n+1:end);

w=M\Y;


% tryb bez rekurencji
% dane uczace
mod=zeros(length(ydynu)-n, 1);
for a = 1 : n
    mod = mod + xdynu(n+1-a:length(xdynu)-a).*w(a) + ydynu(n+1-a:length(ydynu)-a).*w(a+n);
end

for i = 1 : n
    mod=[0;mod];
end

% plot([1:length(mod)], mod, [1:length(ydynu)], ydynu);


% dane weryfikujace
modw=zeros(length(ydynw)-n, 1);
for a = 1 : n
    modw = modw + xdynw(n+1-a:length(xdynw)-a).*w(a) + ydynw(n+1-a:length(ydynw)-a).*w(a+n);
end

for i = 1 : n
    modw=[0;modw];
end

plot([1:length(modw)], modw, [1:length(ydynw)], ydynw);




% tryb z rekurencja
% dane uczace
mod=zeros(length(xdynu), 1);
for i = n+1 : length(xdynu)
    for a = 1 : n
        mod(i) = mod(i)+xdynu(i-n+a-1)*w(a)+mod(i-n+a-1)*w(a+n);
    end
end

plot([1:length(mod)], mod, [1: length(ydynu)], ydynu);




% dane weryfikujace
modw=zeros(length(xdynw), 1);
for i = n+1 : length(xdynw)
    for a = 1 : n
        modw(i) = modw(i)+xdynw(i-n+a-1)*w(a)+modw(i-n+a-1)*w(a+n);
    end
end
plot([1:length(modw)], modw, [1: length(ydynw)], ydynw);