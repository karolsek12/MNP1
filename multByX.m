function wx = multByX(w)
% Zadanie 51
% Karol Sęk, 334831
%
% Generowanie wektora współczynników wielowianu w pomnożonego przez x
% Wejście
% w - wielomian zapisany jako wektor pionowy (macierz nx1), w którym
% i-ty element odpowiada współczynnikowi przy i-1 potędze x
% Funkcja zakłada, że w(n) nie ma znaczenia
% Wyjście
% wx -wielomian zapisany jako wektor pionowy (macierz nx1), w którym
% i-ty element odpowiada współczynnikowi przy i-1 potędze x
% Rozmiar wx jest taki sam jak w, wx(0) = 0 

N = size(w,1);

wx = w; % Przepisanie wektora

wx(1) = 0; % Zgodnie ze specyfikacją funkcji, pierwszy element = 0

for j = 2 : N

    wx(j) = w(j-1); % Symulacja "pomnożenia przez x", poprzez przesunięcie
    ... wartości wektora w

end

end % function