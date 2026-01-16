function err = testnumError(f,b,a,x0,xN,y0,N,table)

x = linspace(x0,xN,N+1);

y = f(x);

ya = runge(b,a,x0,xN,y0,N,table);

error = abs(ya-y);

locerr = error(2);

glerr = max(error);

err = [locerr,glerr];

end