function test1()

f = {@(x) x.^2 + 1,@(x) sin(x),@(x) 1./x, @(x) exp(x),@(x) x.^(1/2)};

functions = ["x^2 + 1","sin(x)","1/x", "e^x","x^(1/2)"];
equations = [
    "5y' +xy = x^3 + 11x",...
    "-y'' + y' + (x^2)y = sin(x) + cos(x) + sin(x)x^2"...
    "(x^4)y''' + (x^3)y'' + (x^2)y' + xy = -4"...
    "y(4) - y''' + y'' -y' + y = e^x"...
    "y(5) + (x^3)y''' + (x)y' = (105/32)x^(-9/2) + (7/8)x^(1/2)"];
a = {
    {@(x) x, @(x) 5},...
    {@(x) x.^2,@(x) 1,@(x) -1},...
    {@(x) x, @(x) x.^2, @(x) x.^3, @(x) x.^4},...
    {@(x) 1, @(x) -1, @(x) 1, @(x) -1, @(x) 1},...
    {@(x) 0, @(x) x, @(x) 0, @(x) x.^3, @(x) 0, @(x) 1}};
b = {@(x) x.^3 + 11*x,...
    @(x) sin(x) + cos(x) + sin(x).*x.^2,...
    @(x) -4,...
    @(x) exp(x),...
    @(x) (105/32)*x.^(-9/2) + (7/8)*x.^(1/2)};
x0 = [-1,0,1,-1,1];
xN = [1,2*pi,2,1,2];
y0 = {2,...
    [0,1],...
    [1,-1,2],...
    [1/exp(1),1/exp(1),1/exp(1),1/exp(1)],...
    [1,1/2,-1/4,3/8,-15/16]};
   

for j = 1:5

    fprintf("Test: %d\n\n", j);
    fprintf("Równanie: %s\n",equations(j));
    fprintf("Rozwiązanie: y = %s,\n\n",functions(j));
    N = 2;

    I = 9;

    m = zeros(1,I);


    for w = 1:I

        x = linspace(x0(j),xN(j),N+1);
        y = f{j}(x);
        yr = runge(b{j},a{j},x0(j),xN(j),y0{j},N);

        m(w) = max(abs(y-yr));
        N = N*2;

    end
    

    r = m(2:I)./m(1:I-1);

    for w = 1:(I-1)
    
        fprintf("Stosunek maksymalnego błędu dla N = %d i N = %d: %d\n",2^(w+1),2^w,r(w));
    end
    
    fprintf("Oczekiwany stosunek: 6.25e-02\n\n\n\n");
    pause('on');
    pause();

end



end