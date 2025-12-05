function c = apro(f,N,n)
% Zadanie 51
% Karol Sęk, 334831
%
% Generowanie wektora pionowego (macierz N+1x1) w którym i-ty element 
... odpowiada współczynnikowi wielomianu Legendre'a stopnia i-1
% Współczynniki są dobrane w taki sposób, żeby wielomian c był 
... przybliżeniem elementu optymalnego przestrzeni wielomianów co najwyżej 
... stopnia N, względem aproksymacji średniokwadratowej ciągłej w 
... przestrzeni funkcji podwójnie całkowalnych w przedziale (-1,1) 
% Funkcja oblicza odpowiednie współczynniki za pomocą 3-punktowej
... kwadratury Gaussa-Legendre'a
% Wejście
% f - uchwyt do funkcji podwójnie całkowalnej w przedziale (-1,1)
% N - najwyższy stopień wielomianu 
% n - ilość podprzedziałów przedziału (-1,1), wykorzystywany w obliczaniu
% wartości współczynników za pomocą kwadratury Gaussa-Legendre'a
% Wyjście
% c - wektor pionowy (macierz N+1x1) w którym i-ty element 
... odpowiada współczynnikowi wielomianu Legendre'a stopnia i-1
... (patrz wyżej)

L = getLegendrePolyBase(N); % Generowana jest macierz N+1xN+1, i-ta
... kolumna macierzy odpowiada wielomianowi Legendre'a i-1 stopnia
... więcej w getLegendrePolyBase

c = zeros(N+1,1);

% Problem aproksymacji średniokwadratowej ciąglej sprowadza się do 
... obliczenia N+1 iloczynów skalarnych

for j = 1:N+1

    temp = getScalarMult(f,L(:,j),n); % Obliczenie iloczynu skalarnego
    ... f i odpowiedniego wielomianu, więcej w getScalarMult
    
    c(j) = temp*(2*j-1)/2; % współczynnik jest pomnożony przez liczbę
    ... zgodną ze wzorem

end
 

end % function