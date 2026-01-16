function b = getButcher23(g,Y,x,h,table)

[B,C] = getTableau(table);

lg = length(g);
ly = length(Y);

K = zeros(ly,4);

G = cell(ly,lg);
simple = @(x) 1;
empty = @(x) 0;

for j = 1:lg
    G{ly,j} = g{j};
end

for j = 1:ly-1

    for s = 1:lg
        G{j,s} = empty;
    end

    G{j,2+j} = simple;

end

for j = 1:4

    nx = B(j,1);
    yx = zeros(size(Y));

    for s = 1:(j-1)
        yx = yx + B(j,s+1)*K(:,s);
    end

    nx = x + nx*h;
    yx = Y + yx;

    K(:,j) = h * calcF(G,yx,nx);

end

b = zeros(ly,1);

for j = 1:4

    b = b + C(j)*K(:,j);

end

end