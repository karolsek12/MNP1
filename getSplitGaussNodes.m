function nodes = getSplitGaussNodes(n)
% Zadanie 51
% Karol Sęk, 334831
%
% Generowanie wektora punktów dla złożonej kwadratury Gaussa-Legendre'a
... 3 punktowej w przedziale (-1,1)
% Po odpowiednim przeskalowaniu każde 3 kolejne punkty odpowiadają 
... miejscom zerowym wielomianowi Legendre'a 3-stopnia
% Wejście
% n - ilość podprzedziałow przedziału(-1,1)
% Wyjście
% nodes - wektor pionowy (macierz 3*n x 1) odpowiednich punktów
... (patrz wyżej) 


baseNodes = [
    -7.7459666924148337704e-01,...
    0.0000000000000000000e+00,...
    7.7459666924148337704e-01
    ];
% Dla tej funkcji kwadratura jest zawsze 3-punktowa

nodes = zeros(3*n,1);

inc = 2/n; % Długośc podprzedziału


for j=1:n

    a = -1 + inc*(j-1); % a - lewy koniec podprzedziału
    b = a + inc; % b - prawy koniec podprzedziału

    temp =  (b-a)*baseNodes + a + b;
    temp = temp/2;
    % Odpowiednie przeskalowanie przedziału na przedział (-1,1)
    
    nodes(3*(j-1)+1:3*(j-1)+3) = temp; % Zapisanie 3 wartości do 
    ... do odpowiednich pozycji
end

end % function