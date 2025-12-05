function pv = getPolyValues(p,nodes)
% Zadanie 51
% Karol Sęk, 334831
%
% Obliczenie wartości wielomianu w danych punktach
% Wejście
% p - wielomian zapisany jako wektor pionowy (macierz nx1), w którym
% i-ty element odpowiada współczynnikowi przy i-1 potędze x
% nodes - wektor liczb rzeczywistych dla których obliczane
% będą wartości wielomianu
% Wyjście
% pv - wektor poziomy (macierz 1xm), w którym 1-ty element odpowiada 
% wartości wielomianu p w punkcie nodes(i)

n = length(p);
m = length(nodes);

% Funkcja wykorzystuje schemat Hornera do szybkiego i precyzyjnego
... obliczenia wartości wielomianu

% Schemat Hornera
pv = ones(1,m)*p(n); 

for k=n-1:-1:1

    pv = p(k) + nodes.*pv;

end

end % function