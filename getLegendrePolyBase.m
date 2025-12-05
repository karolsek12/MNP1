function B = getLegendrePolyBase(N)
% Zadanie 51
% Karol Sęk, 334831
%
% Generowanie macierzy rozmiaru N+1 na N+1,
% w której element na i-tym wierszu i j-tej kolumnie odpowiada
% współczynnikowi przy i-1 potędze x w wielomianie Legendre'a j-1 stopnia.
% Wejście
% N - największy stopien wielomianu występujący w zwracanej macierzy
% Wyjście
% B - wygerenowana macierz (patrz wyżej)

B = zeros(N+1,N+1); % Inicjalizacja macierzy, najwyższy wielomian ma być
... stopnia N, macierzy musi jednak być rozmiaru N+1 na N+1 ponieważ w 
... 1 kolumnie występują współczynniki wielomianu stopnia 0

% Żeby policzyć współczynniki, funkcja używa wzoru rekurencyjnego dla
... wielomianów Legendre'a, dlatego pierwsze 2 wielomiany są zapisywane
... manualnie

B(1,1) = 1; % Wielomian Legendre'a stopnia 0, P_0(x) = 1
B(2,2) = 1; % Wielomian Legendre'a stopnia 1, P_1(x) = x.

for j = 3:N+1 % Pierwsze dwa "wielomiany" zostały już zapisane

    temp1 = multByX(B(:,j-1)); 
    % Do zmiennej pomocniczej zapisuję współczynniki wielomianu z 
    ... poprzedniej kolumny pomnożonego przez x, więcej w funkcji myltByX

    temp1 = temp1*(2*j-3)/(j-1); 
    % Mnożę współczynniki zgodnie ze wzorem  rekurencyjnym

    temp2 = B(:,j-2)*(j-2)/(j-1);
    % Do zmiennej pomocniczek zapisuję współczynniki wielomianu stopnia
    ... o 2 mniejszego niż szukany

    B(:,j) = temp1 - temp2;
    % Dodaję współczynniki zgodnie ze wzorem

end


end % function