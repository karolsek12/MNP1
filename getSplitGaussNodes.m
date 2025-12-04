function nodes = getSplitGaussNodes(n)

baseNodes = [
    -7.7459666924148337704e-01,...
    0.0000000000000000000e+00,...
    7.7459666924148337704e-01
    ];

nodes = zeros(3*n,1);

inc = 2/n;


for j=1:n

    a = -1 + inc*(j-1);
    b = a + inc;

    temp =  (b-a)*baseNodes + a + b;
    temp = temp/2;
    
    nodes(3*(j-1)+1:3*(j-1)+3) = temp;

end

end