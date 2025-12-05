function y = legendreEval(lcoeffs,x)
% Zadanie 51
% Karol Sęk, 334831
%
% Obliczenie wartości wielomianu, wyrażonego w bazie wielomianów 
... Legendre'a, w danych punktach
% Wejście
% lcoeffs - wielomian w bazie wielomianów Legendre'a
% x - wektor punktów w przedziale (-1,1)
% Wyjście
% y - wektor poziomy (macierz 1xm) wartości danego wielomianu 

N = length(lcoeffs);
L = getLegendrePolyBase(N-1); % Generowana jest macierz N+1xN+1, i-ta
... kolumna macierzy odpowiada wielomianowi Legendre'a i-1 stopnia
... więcej w getLegendrePolyBase 
y = zeros(1,length(x));

for j = 1:N
    p = L(:,j); % Przekopiowanie j-tej kolumny do p, p odpowiada 
    ... wielomianowi Legendre'a j-1 stopnia
    y = y + lcoeffs(j)*getPolyValues(p,x); % Obliczenie wartości wielomianu
    ... więcej w getPolyValues
end

end % function
