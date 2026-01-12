function y = runge(b, a, x0, xN, y0, N,table)

if nargin < 7
    table = 0;
end


l = length(y0);
Y = zeros(l,N+1);
Y(:,1) = y0;

g = isolateHighest(a,b);
h = (xN-x0)/N;
x = x0;

for j=2:(N+1)
    
    inc = getButcher23(g,Y(:,j-1),x,h,table); 
    Y(:,j) = Y(:,j-1) + inc;
    x = x+h;

end

    y = Y(1,:);

end