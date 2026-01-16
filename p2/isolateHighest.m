function g = isolateHighest(a,b)
% Projekt 2, zadanie 47
% Karol Sęk, 334831
% 
% Wyznaczanie tablicy komórkowej, odpowiadającej równaniu różniczkowego
% liniowego postaci F(x,y) = y(k), gdzie y(k) - najwyższa pochodna 
% rozwiązania równania. 
% Np. równanie 5y' + xy = 3 jest transformowane na y' = (-x/5)*y + 3/5
% WEJŚCIE
%   b - uchwyt do funkcji będącej wyrazem wolnym równania różniczkowego
%   a - tablica komórkowa uchwytów do funkcji, przy czym 
%   a{i} - funkcja przy (i-1) pochodnej funkcji   
% WYJŚCIE
%   g - tablica komórkowa uchwytów do funkcji, przy czym
%   g{0} = b/a{k}, g{i} = -a{i-1}/a{k}, gdzie a{k} - funkcja przy 
%   najwyższej pochodnej równania

k =  length(a);

div = a{k}; 

g = {b, a{1:k-1}}; % Odpowiednie przypisanie do tablicy g, zgodnie z
% regułą opisaną wyżej.

g{1} = @(x) g{1}(x)./div(x); % Wyraz wolny nie wymaga zmiany znaku, 
% jest więc oddzielnie rozważany.

for j = 2:k
    g{j} = @(x) g{j}(x)./(-1 *div(x));
end