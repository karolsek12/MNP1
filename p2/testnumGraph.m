function testnumGraph(f,b,a,x0,xN,y0,N)
% Projekt 2, zadanie 47
% Karol Sęk, 334831
% 
% Test numeryczny generujący wykres funkcji f, oraz jej przybliżenia.
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

x = linspace(x0,xN,N+1);

y = f(x);
ya = runge(b,a,x0,xN,y0,N);

plot(x,y,'MarkerFaceColor', 'r');
hold on;
plot(x,ya,'MarkerFaceColor', 'b');
legend('f','przybliżenie f');
xlabel('x','FontSize', 20);
ylabel('y','Rotation', 0,'FontSize', 20);
axis([x0 xN min(y), max(y)]);
grid on;
hold off;

end