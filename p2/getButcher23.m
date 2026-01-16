function b = getButcher23(g,Y,x,h,table)
% Projekt 2, zadanie 47
% Karol Sęk, 334831
% 
% Wyznaczanie przesunięcia w metodzie Runge' Kutta 4. rzędu.
% WEJŚCIE
%   g - tablica komórkowa uchwytów do funkcji występujących w równaniu
%   postaci F(x,y) = y(k), gdzie y(k) - najwyższa pochodna rozwiązania
%   równiania.
%   Y - wektor wartości funkcji i jej kolejnych pochodnych, wyznaczonych
%   w poprzednim kroku metody.
%   x - poprzedni punkt dla ktorego wartości zostały wyznaczone w 
%   poprzednim kroku metody.
%   h - przesunięcie punktu.
%   table - argument wyznaczający tabelkę Butcher'a 
%   użytą w obliczeniech, 0 - tabela 3/8, 1 - tabela klasyczna, 
%   inna wartość - tabela ralstona
% WYJŚCIE
%   b - wektor przesunięć wartości funkcji i ich pochodnych, jeśli Y 
%   to wektor wartości w i-tym kroku (Y_i = Y) to Y_(i+1) = Y + b

[B,C] = getTableau(table); % Funkcja getTableau zwraca wartości 
% odpowiedniej tabeli Butchera, ostatni wiersz tabelki jest odizolowany,
% zapisany jest do wektora C.

lg = length(g);
ly = length(Y);
G = cell(ly,lg); % Macierz komórkowa zawierająca odpowiednie uchwyty.
simple = @(x) 1;
empty = @(x) 0;
% W metodzie Runge'a Kutta dowolnego rzędu, wiele równiań jest postaci
% y(i) = y(j), dlatego duża częśc macierzy G, zawiera funkcje g(x) = 1, 
% lub g(x) = 0, odpowiadają im uchwyty simple i empty. 

for j = 1:lg
    G{ly,j} = g{j}; % Ostatni wiersz odpowiada właściwemu równaniu.
end

for j = 1:ly-1
    for s = 1:lg
        G{j,s} = empty;
    end
    G{j,2+j} = simple;
end
% Zapisanie prostych uchwtytów do odpowiednich miejsc.

K = getK(B,x,h,G,Y,table); % Funkcja getK wyznacza macierz współczynników,
% potrzebnych do wyznaczenia przesunięcia w metodzie Runge'a Kutty.

b = zeros(ly,1);
for j = 1:4
    b = b + C(j)*K(:,j); % Zgodnie ze wzorem przesunięcie jest 
    % liniową kombinacją współczynników K.
end