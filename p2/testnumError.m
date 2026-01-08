function testnumError(f,b,a,x0,xN,y0,N)

x = linspace(x0,xN,N+1);

y = f(x);

ya = runge(b,a,x0,xN,y0,N);

error = abs(ya-y);


fprintf("Średni błąd bezwzględny = %d\n",mean(error));

fprintf("Maksymalny błąd bezwzględny = %d\n",max(error));

end