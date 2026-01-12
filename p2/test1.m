function test1()

[f,functions,equations,a,b,x0,xN,y0] = getTest1Data();

for j = 1:5

    fprintf("Test: %d\n\n", j);
    fprintf("Równanie: %s\n",equations(j));
    fprintf("Rozwiązanie: y = %s,\n\n",functions(j));
    N = 2;

    I = 7;

    g = zeros(1,I);
    lok = zeros(1,I);

    for w = 1:I

        x = linspace(x0(j),xN(j),N+1);
        y = f{j}(x);
        yr = runge(b{j},a{j},x0(j),xN(j),y0{j},N);

        g(w) = max(abs(y-yr));
        lok(w) = abs(y(2) - yr(2));
        N = N*2;

    end
    

    rg = g(2:I)./g(1:I-1);
    rl = lok(2:I)./lok(1:I-1);

    for w = 1:(I-1)
    
        fprintf("Stosunek błędu globalnego dla N = %d i N = %d: %d\n",2^(w+1),2^w,rg(w));

    end
    
    fprintf("Oczekiwany stosunek błedu globalnego: 6.25e-02\n\n");

    for w = 1:(I-1)
    
        fprintf("Stosunek błędu lokalnego dla N = %d i N = %d: %d\n",2^(w+1),2^w,rl(w));
    end
        
    fprintf("Oczekiwany stosunek błedu lokalnego: 3.125e-02\n\n")
    pause('on');
    pause();

end

end