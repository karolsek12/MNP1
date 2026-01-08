function g = isolateHighest(a,b)

k =  length(a);

div = a{k}; 

g = {b, a{1:k-1}};

g{1} = @(x) g{1}(x)./div(x);

for j = 2:k

    g{j} = @(x) g{j}(x)./(-1 *div(x));

end

end