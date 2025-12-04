function TestgetScalarMult()
n = 1;
p = zeros(1,n);
p(1) = 1;

values = [2,0,2/3,0,2/5,0,2/7];
functions = ["1","x","x^2","x^3","x^4","x^5","x^6"];

for i = 1:7

f = @(x) x.^(i-1);


fprintf("Test: %d\n", i);
fprintf("f(x) = %s, p(x) = 1\n",functions(i));

if i ~= 7
    fprintf("Oczekiwana wartość: %d\n",values(i));
else
    v = values(i);
    fprintf("Oczekiwana wartość: %d - %d  = %d\n",v, 8/175, v - 8/175);
end

fprintf("Obliczona wartość: %d\n\n\n\n",getScalarMult(f,p,n));

if(mod(i,3) == 0)
    pause('on');
    pause();
end

end


end