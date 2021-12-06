% ficheiro efa20_1.m
%
% v2020-11-07
% Diogo Antao

x=0:0.01:1.4;

figure(1);
y1=0.2-x+sin(0.75*x);
plot(x,y1,";g(x);");
title("Grafico de y = g(x)");
grid;
xlabel("x");

figure(2);
y2_1=0.2+sin(0.75*x);
y2_2=x;
plot(x,y2_1,";f(x);");
hold on;
plot(x,y2_2,";x;");
hold off;
title("Grafico conjunto de y = f(x) e y = x");
grid;
xlabel("x");

figure(3);
y3=0.75*cos(0.75*x);
plot(x,y3,";f'(x);");
title("Grafico de y = f'(x)");
grid;
xlabel("x");

% EOF