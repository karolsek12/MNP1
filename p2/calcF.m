function F = calcF(G,Y,x)

k = size(G,1);
F = zeros(k,1);

for j = 1:k

    for s = 1:k
    
        F(s) = F(s) +G{s,j+1}(x)*Y(j);

    end
end


for s = 1:k
    
    F(s) = F(s) +G{s,1}(x);

end

end