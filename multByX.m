function wx = multByX(w)

N = size(w,1);

wx = w;

wx(1) = 0;

for j = 2 : N

    wx(j) = w(j-1); 

end

end