function testnumGraph(f,b,a,x0,xN,y0,N)

x = linspace(x0,xN,N+1);

y = f(x);
ya = runge(b,a,x0,xN,y0,N);

plot(x,y,'MarkerFaceColor', 'r');
hold on;
plot(x,ya,'MarkerFaceColor', 'b');
legend('f','przybliżenie f');
xlabel('x','FontSize', 20);
ylabel('y','Rotation', 0,'FontSize', 20);
axis([x0 xN min(y), max(y)]);
grid on;
hold off;

end