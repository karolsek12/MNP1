function B = getLegendrePolyBase(N)

B = zeros(N+1,N+1);

B(1,1) = 1;
B(2,2) = 1;

for j = 3:N+1

    temp1 = multByX(B(:,j-1));
    temp1 = temp1*(2*j-3)/(j-1);

    temp2 = B(:,j-2)*(j-2)/(j-1);

    B(:,j) = temp1 - temp2;

end


end