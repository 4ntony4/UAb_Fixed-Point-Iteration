% ficheiro pontofixo3.m
%
% v2020-11-07
% Diogo Antao

function [r,e,x] = pontofixo3(f,L,x0,ed,kmax)
% Metodo do ponto fixo para raiz de g(x)=0 com x=f(x)
% Algoritmo 1.2 do manual
%
% [r,e,x] = pontofixo3(f,L,x0,ed,kmax)
%
% f - referencia para funcao f(x)
% L - valor maximo de |f'(x)|
% x0 - estimativa inicial
% ed - erro maximo desejado e=|r-xk|<=ed (criterio de paragem)
% kmax - limite de iteracoes
%
% r - estimativa da raiz r=xn
% e - erro absoluto da estimativa |r-xn|
% x - vetor com as iteracoes [x0 x1 ... xn]

k=0;
x1=f(x0);
x=x0;

while ( abs(x1-x0)>ed && k<kmax )
  x0=x1;
  x1=f(x0);
  k=k+1;
  x(k+1)=x0;
endwhile

r=x1;
e=abs(x1-x0);

% EOF