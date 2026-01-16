function err = testnumError(f,b,a,x0,xN,y0,N,table)
% Projekt 2, zadanie 47
% Karol Sęk, 334831
% 
% Test numeryczny wyznaczający błąd globalny i lokalny metody.
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
% Wyjście
%   err - wektor zawierający błąd globalny, err(1) - błąd lokalny
%   err(2) - błąd globalny

x = linspace(x0,xN,N+1);

y = f(x);

ya = runge(b,a,x0,xN,y0,N,table);

error = abs(ya-y);

locerr = error(2); % Błąd lokalny definiujemy jako różnicę wartości
% w pierwszym kroku.

glerr = max(error); % Błąd globalny definiujemy jako maximum róznic
% wartości.

err = [locerr,glerr];