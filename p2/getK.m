function K = getK(B, x, h, G, Y,table)
% Projekt 2, zadanie 47
% Karol Sęk, 334831
% 
% Wyznaczanie współczynników K wystepujących
% w metodzie Runge' Kutta 4. rzędu.
% WEJŚCIE
%   B - macierz odpowiadająca pewnej tabeli Butchera.
%   x - punkt dla ktorego wartości zostały wyznaczone w 
%   poprzednim kroku metody.
%   h - przesunięcie punktu
%   Y - wektor wartości funkcji i jej kolejnych pochodnych, wyznaczonych
%   w poprzednim kroku metody.
%   G - macierz komórkowa zawierająca uchwyty do funkcji występujących
%   w równaniu różniczkowym.
%   table - argument wyznaczający tabelkę Butcher'a 
%   użytą w obliczeniech, 0 - tabela 3/8, 1 - tabela klasyczna, 
%   inna wartość - tabela ralstona
% WYJŚCIE
%   K - macierz współczynników K

ly = length(Y);

K = zeros(ly,4);

for j = 1:4
    nx = B(j,1); % Pierwsza kolumna macierzy B zawiera wcześniej 
    % wyliczone współczynniki potrzebne do obliczenia wartości K.
    yx = zeros(size(Y));

    if(table ~= 1) % Jeśli rozważana jest klasyczna tabela Butchera
        % mozna pominąc kilka obliczeń.
        for s = 1:(j-2)
            yx = yx + B(j,s+1)*K(:,s);
        end
    end

    if(j-1>0)
        yx = yx + B(j,j)*K(:,j-1);
    end

    nx = x + nx*h;
    yx = Y + yx;

    K(:,j) = h * calcF(G,yx,nx); %Funkcja calcF wylicza wartość funkcji 
    % F wyznaczającej równanie różniczkowe.
end
