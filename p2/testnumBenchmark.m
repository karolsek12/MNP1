function O = testnumBenchmark(f,b, a, x0, xN, y0, N)
% Projekt 2, zadanie 47
% Karol Sęk, 334831
% 
% Test numeryczny wyznaczający błąd globalny i lokalny, oraz czas 
% wykoniania dla 3 tabeli Butcher'a (3/8, klasyczna, Ralstona).
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
% Wyjście
%   O - macierz w której 1. kolumna - błąd lokalny, 
%   2. kolumna - błąd globalny, 3. kolumna - czas wykonania w sekundach,
%   1. wiersz - metoda 3/8, 2. wiersz - metoda klasyczna, 
%   3. wiersz - metoda Ralstona.

O = zeros(3,3);

iters = 5;

for j = 1:3
    tic;
    O(j,1:2) = testnumError(f,b,a,x0,xN,y0,N,j-1);
    time = toc;

    for w = 2:iters
        tic;
        testnumError(f,b,a,x0,xN,y0,N,j-1);
        time = time + toc;
    end

    O(j,3) = time/iters;
end