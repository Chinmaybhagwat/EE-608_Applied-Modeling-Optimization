%%
clf
syms x1 x2;
[X,Y] = meshgrid(0:0.1:10,0:0.1:10);
%fcontour(@(x1,x2) (x1-1)^2+2*(x2-2)^2)

figure(1)
F =(x1-1).^2 +2*(x2-2).^2;
fcontour(F,'linewidth',1); 
hold on
H1x=x1^2+x2^2>=1; 
H2x=x1+x2>=0;

s1 = solve(H1x,[x1])    %Solving the equations
s2 = solve(H2x,[x2])
fplot(s1)               %Plottig values of solved H1x and H2x equations
fplot(s2)
xlim([-10 10])
ylim([-10 10])
hold on
grid on
hold off




