function y = runge(b, a, x0, xN, y0, N,table)
% Projekt 2, zadanie 47
% Karol Sęk, 334831
% 
% Wyznaczanie wartości funkcji będącej rozwiązaniem 
% równiania różniczkowego liniowego dowolnego rzędu 
% metodą Rungego-Kutty rzędu 4-go, wzór 3/8.
% WEJŚCIE
%   b - uchwyt do funkcji będącej wyrazem wolnym równania różniczkowego
%   a - tablica komórkowa uchwytów do funkcji, przy czym 
%   a{i} - funkcja przy (i-1) pochodnej funkcji   
%   x0 - lewe ograniczenie przedziału na którym wyznaczane 
%   będą wartości funkcji 
%   xN - prawe ograniczenie przedziału na którym wyznaczane 
%   będą wartości funkcji
%   y0 - wektor wartości funkcji oraz kolejnych pochodnych w punkcjie x0
%   N - liczba podprzedziałow na który będzie podzielony przedział <x0,xN>
%   table - argument opcjonalny, wyznacza tabelkę Butcher'a 
%   użytą w obliczeniech, 0 - tabela 3/8, 1 - tabela klasyczna, 
%   inna wartość - tabela ralstona, table przyjmuje wartość domyślną 0
% WYJŚCIE
%   y - wektor rozmiaru N+1 wartości szukanej funkcji,
%   y(0) = y0, jeśli f to szukana funkcja to y(i) = f(x0 + i*(xN-x0)/N)

if nargin < 7
    % Ustawienie table jeśli nie została określona w wywołaniu funkcji.
    table = 0; 
end

l = length(y0);
Y = zeros(l,N+1); % 1. wiersz Y będzie zawierał  wartości szukanej funkcji 
% w odpowiednich punktach,  2. wiersz wartości pierwszej pochodnej itd.
Y(:,1) = y0;

g = isolateHighest(a,b); 
% Funkcja isolateHighest zwraca tablicę komórkową w której pierwszą 
% wartością jest wyraz wolny równiania, kolejne wartości to funkcje 
% z tablicy a, ze zmienionym znakiem oraz 
% podzielone przez funkcję przy y(k). Więcej w isolateHighest.

h = (xN-x0)/N; % Odstęp pomiędzy kolejnymi punktami.
x = x0;

for j=2:(N+1)
    inc = getButcher23(g,Y(:,j-1),x,h,table); % getButcher23 wyznacza 
    % przesunięcie względem wartości w następnym punkcie,
    % więcej w getButcher23.
    Y(:,j) = Y(:,j-1) + inc;
    x = x + h;
end

y = Y(1,:); % Pierwszy wiersz Y to wartości szukanej funkcji w 
% opdowiednich punktach.