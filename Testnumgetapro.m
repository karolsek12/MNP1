function  Testnumgetapro(f,N,n)

x = linspace(-1,1,1000);

lcoeffs = apro(f,N,n);

plot(x,legendreEval(lcoeffs,x));
hold on;
plot(x,f(x));
legend("Aproksymacja","Originalna funkcja");
hold off;
xlabel("x",'FontSize',15);
ylabel("y","FontSize",15,'Rotation', 0);
grid on;

end