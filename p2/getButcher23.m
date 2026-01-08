function b = getButcher23(g,Y,x,h)

B = [   0  0 0 0;
      1/3  0 0 0
     -1/3  1 0 0;
        1 -1 1 0];

C = [1/8,3/8,3/8,1/8];

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

K(:,1) = h*calcF(G,Y,x);

for j = 2:4 % can be optimised

    nx = 0;
    yx = zeros(size(Y));

    for s = 1:(j-1)
        nx = nx + B(j,s);
        yx = yx + B(j,s)*K(:,s);
    end

    nx = x + nx*h;
    yx = Y + yx;

    K(:,j) = h* calcF(G,yx,nx);

end

b = zeros(ly,1);

for j = 1:4

    b = b+  C(j)*K(:,j);

end

end