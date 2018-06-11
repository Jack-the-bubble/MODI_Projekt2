format long
a=importdata('Dane/danestat37.txt');
% dane=getfield(a, 'data')
a=sortrows(a);
x=a(1:end, 1);
y=a(1:end, 2);