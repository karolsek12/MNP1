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
%   table - 

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