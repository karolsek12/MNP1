function showcase(choice,N)

x0 = -1;
xN = 1;
y0 = 2;

f = @(x) x.^2 +1;


if (choice == 1)
    a = {@(x) x, @(x) 5};
    b = @(x) x.^3 + 11*x;
else
    a = {@(x) 5, @(x) x};
    b = @(x) 7*x.^2+ 5;
end

testnumGraph(f,b,a,x0,xN,y0,N);
testnumError(f,b,a,x0,xN,y0,N);


end