function c = apro(f,N,n)

L = getLegendrePolyBase(N);

c = zeros(N+1,1);

for j = 1:N+1

    
    temp = getScalarMult(f,L(:,j),n);
    
    c(j) = temp* (2*j-1)/2;

end
 

end