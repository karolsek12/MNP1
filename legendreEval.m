function y = legendreEval(lcoeffs,x)

N = length(lcoeffs);
L = getLegendrePolyBase(N-1);
y = zeros(1,length(x));

for j = 1:N
    p = L(:,j);
    y = y + lcoeffs(j)*getPolyValues(p,x);
end

end
