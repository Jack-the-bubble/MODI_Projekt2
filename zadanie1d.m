run('initProjekt2')

danUczX=x(1:2:end);
danWerX=x(2:2:end);
danUczY=y(1:2:end);
danWerY=y(2:2:end);

M=ones([length(danUczX), 1]);

n=4;

for i=1:n
    M=[M danUczX.^i];
end

w=M\danUczY

% wartości modelu dla danych uczących

yU=zeros([length(danUczX), 1]);

% length(danUczX)
% length(yU)
  for i=0:n
      yU=yU+(danUczX.^i)*w(i+1);
  end
  lu=length(danUczX);
  figure
  plot([1:lu], danUczY)
  hold on
  plot([1:lu], yU)
  hold off
% błąd dla danych uczących
  Eu=norm((M*w-danUczY).^2)
  
% wartości modelu dla danych weryfikujących

yW=zeros([length(danWerX), 1]);

  for i=0:n
      yW=yW+(danWerX.^i)*w(i+1);
  end
lw=length(danWerX);
  figure
  plot([1:lw], danWerY)
  hold on
  plot([1:lw], yW)
  hold off
  
% błąd dla danych weryfikujących
  Ew=norm((M*w-danWerY).^2)