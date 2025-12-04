function pv = getPolyValues(p,nodes)

n = length(p);
m = length(nodes);

pv = ones(1,m)*p(n);

for k=n-1:-1:1

    pv = p(k) + nodes.*pv;

end