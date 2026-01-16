function F = calcF(G,Y,x)
% Projekt 2, zadanie 47
% Karol Sęk, 334831
% 
% Wyznaczanie wartości funkcji F, odpowiadającej pewnemu
% równaniu różniczkowemu
% WEJŚCIE
%   G - macierz komórkowa zawierająca uchwyty do funkcji występujących
%   w równaniu różniczkowym.
%   x - punkt dla ktorego wartości zostały wyznaczone w 
%   poprzednim kroku metody.
%   Y - wektor wartości funkcji i jej kolejnych pochodnych, wyznaczonych
%   w poprzednim kroku metody.
% WYJŚCIE
%   F - wektor wartości funkcji F

k = size(G,1);
F = zeros(k,1);

for j = 1:k
    for s = 1:k
        F(s) = F(s) +G{s,j+1}(x)*Y(j);
    end
end

for s = 1:k 
    F(s) = F(s) +G{s,1}(x);% Ostatni wiersz G odpowiada wyrazowi wolnemu
    % równania rózniczkowego, jest on więc niezależny od Y i wyznaczany
    % oddzielnie.
end
