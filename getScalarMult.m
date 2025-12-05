function s = getScalarMult(f, p, n)
% Zadanie 51
% Karol Sęk, 334831
%
% Obliczenie wartości iloczynu skalarnego funkcji f i wielomianu p
... za pomocą złożonej 3 punktowej kwadratury Gaussa-Legendre'a 
% Funkcja zakłada, że iloczyn skalarny to całka oznaczona od -1 do 1
% iloczynu funkcji f i wielomianu p, z funkcją wagową w(x) = 1
% Wejście
% f - uchwyt do funkcji
% p - wielomian zapisany jako wektor pionowy (macierz nx1), w którym
% i-ty element odpowiada współczynnikowi przy i-1 potędze x
% n - ilość podprzedziałow przedziału(-1,1)
% Wyjście
% s - obliczona wartość iloczynu skalarnego

s = 0;
coeff =  [
    5.5555555555555555556e-01,...
    8.8888888888888888889e-01,...
    5.5555555555555555556e-01
];
% Dla tej funkcji kwadratura jest zawsze 3-punktowa

nodes = getSplitGaussNodes(n); % Przedział (-1,1) jest dzielony na
... n podprzedziałów, następnie w każdym przedziale wybierane są
... 3 węzły zgodnie z kwadraturą Gaussa, wszystkie węzły są łączone w 
... jeden wektor, więcej w getSplitGaussNodes

fv = f(nodes); % Wyliczenie wartości funkcji f w odpowiednich punktach
pv = getPolyValues(p,nodes); % Wyliczenie wartości wielomianu p w 
... odpowiednich punktach, więcej w getPolyValues

for j = 1:n % Iteracja dla każdego przedziału

    temp = 0;
    for k = 1:3 % Zgodnie ze wzorem sumujemy F(x_i)*A_i
        temp = temp + coeff(k)*fv(3*(j-1)+k)*pv(3*(j-1)+k);
    end
    % Wektory fv i pv są sklejonymi wektorami wszystkich wartości
    ... dla kolejnych popdprzedziałów, dla każdej iteracji pobieramy 
    ... 3 kolejne wartości
    
    s = s + temp;

end

s = s/n; % Kwadratura jest złozona, wynik jest dzielony przez ilość
... podprzedziałów

end % function