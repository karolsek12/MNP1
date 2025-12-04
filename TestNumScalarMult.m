function TestNumScalarMult(n)

N = 1;
p = zeros(1,N);
p(1) = 1;

values = [exp(1)-exp(-1),0,0,4/3];
functions = ["e^x","sign(x)","sin(x)","abs(x)^(1/2)"];
f = {@(x) exp(x),@(x) sign(x), @(x) sin(x), @(x) x.^(1/2)};


for i = 1:4


fprintf("Test: %d\n", i);
fprintf("f(x) = %s\n",functions(i));
fprintf("Oczekiwana wartość: %d\n",values(i));

fprintf("Obliczona wartość: %d\n\n\n\n",getScalarMult(f{i},p,n));

end




end