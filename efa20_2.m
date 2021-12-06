% ficheiro efa20_2.m
%
% v2020-11-07
% Diogo Antao

% referencia para as funcoes f(x) e f'(x) (funcoes anonimas)
f=@(x) 0.2 + sin(0.75*x);
f1=@(x) 0.75*cos(0.75*x);

% metodo ponto fixo (para resolver g(x)=0)
x0=0.2;
L=f1(0);    % L = max |f'(x)|
ed=(1-L)/L*0.5e-2;  % solucao com 2 decimais significativos
kmax=20;
[r,e,vX]=pontofixo3(f,L,x0,ed,kmax);

% criacao da matriz Red m x 2 
%% (com os pontos (x,y) que representam as alteracoes em x e f(x))
k=1;

while ( k<=length(vX)-1 )
  % primeiro par ordenado de 4
  Red(4*k-3,1)=vX(k);      % coordenada x
  Red(4*k-3,2)=vX(k+1);    % coordenada y
  
  % segundo par ordenado de 4
  Red(4*k-2,1)=vX(k+1);    % coordenada x
  Red(4*k-2,2)=vX(k+1);    % coordenada y
  
  % para k = length(vX)-1 so' se podem calcular os 2 primeiros pares ordenados
  if(k==length(vX)-1)
    break;
  else
  % terceiro par ordenado de 4
  Red(4*k-1,1)=vX(k+1);    % coordenada x
  Red(4*k-1,2)=vX(k+1);    % coordenada y
  
  % ultimo par ordenado de 4
  Red(4*k,1)=vX(k+1);    % coordenada x
  Red(4*k,2)=vX(k+2);    % coordenada y
  
  k++;
  end
end

% grafico de f(x), x e representacao das alteracoes em x e f(x)
x=0:0.01:1.4;
y1=f(x);
y2=x;
plot(x,y1,"k;f(x);","linewidth",3);
title("x=f(x) Metodo do Ponto Fixo");
grid;
xlabel("x");
ylabel("f(x)");
hold on; 
plot(x,y2,"b;x;","linewidth",3);
plot(x0,f(x0),"r*;;","markersize",15);
plot(Red(:,1),Red(:,2),"r;;","linewidth",2);
hold off;

% EOF