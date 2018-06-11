format long
ducz=importdata('Dane/danedynucz37.txt');
xdynu=ducz(1:end, 1);
ydynu=ducz(1:end, 2);

dwer=importdata('Dane/danedynwer37.txt');
xdynw=dwer(1:end, 1);
ydynw=dwer(1:end, 2);

r=7; % rząd dynamiki (u(k-r))
n=8; % rząd wielomianu (u^n(k-1))

M=zeros(length(xdynu)-r, r*n*2);
for a = 1: length(xdynu) - r
    for j = 1 : n %rząd wielomianu
        for i = 1 : r %rząd dynamiki
            M(a, j*r-i+1) = xdynu(a+i-1)^j;
            M(a, r*n+j*r-i+1)=ydynu(a+i-1)^j;
        end
    end
end

Y=ydynu(r+1:end);
w=M\Y;

% tryb bez rekurencji
% zbior uczacy
mod=zeros(length(xdynu)-r, 1);
for i = 1 : n
    for j = 1 : r
        mod = mod + (xdynu(j+1: length(xdynu)-(r-j)).^i)*w(r*(i-1)+j);
        mod = mod + (ydynu(j+1: length(ydynu)-(r-j)).^i)*w(n*r+r*(i-1)+j);
    end
end

for i = 1 : r
    mod=[0;mod];
end


% plot([1:length(mod)], mod, [1: length(ydynu)], ydynu);

% zbior weryfikujacy

modw=zeros(length(xdynw)-r, 1);
for i = 1 : n
    for j = 1 : r
        modw = modw + (xdynw(j+1: length(xdynw)-(r-j)).^i)*w(r*(i-1)+j);
        modw = modw + (ydynw(j+1: length(ydynw)-(r-j)).^i)*w(n*r+r*(i-1)+j);
    end
end

for i = 1 : r
    modw=[0;modw];
end


% plot([1:length(modw)], modw, [1: length(ydynw)], ydynw);

% tryb z rekurencja
% dane uczace

mod = zeros(length(xdynu), 1);
for a = r + 1 : length(xdynu)
    for i = 1 : n
        for j = 1 : r
            mod(a) = mod(a) + ((xdynu(a-r+j-1))^i)*w(r*(i-1)+j)+((mod(a-r+j-1))^i)*w(r*n+r*(i-1)+j);
        end
    end
end

plot([1:length(mod)], mod, [1:length(ydynu)], ydynu);

