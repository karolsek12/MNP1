function s = getScalarMult(f, p, n)

s = 0;
coeff =  [
    5.5555555555555555556e-01,...
    8.8888888888888888889e-01,...
    5.5555555555555555556e-01
];

nodes = getSplitGaussNodes(n);

fv = f(nodes);
pv = getPolyValues(p,nodes);

for j = 1:n

    temp = 0;
    for k = 1:3
        temp = temp + coeff(k)*fv(3*(j-1)+k)*pv(3*(j-1)+k);
    end
    
    s = s + temp;

end

s = s/n;

end