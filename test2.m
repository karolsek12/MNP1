function test2()
% Zadanie 51
% Karol Sęk, 334831
%
% Funkcja testująca funkcję getScalarMult

n = 1;

p = zeros(1,n);
p(1) = 1;
% W tym teście znaczenie ma wynik kwadratury,
... dla p = 1 iloczyn skalarny f i p jest po prostu całką f od -1 do 1


values = [2,0,2/3,0,2/5,0,2/7];
functions = ["1","x","x^2","x^3","x^4","x^5","x^6"];
% Funkcje których kwadratury będą obliczane, oraz właściwe analitycznie
... obliczone wartości całek

for i = 1:7

f = @(x) x.^(i-1);


fprintf("Test: %d\n", i);
fprintf("f(x) = %s, p(x) = 1\n",functions(i));

if i ~= 7 % Kwadratura 3-punktowa Gaussa jest rzędu 6, dla wielomianów 
    ... stopnia co najwyżej 5 nie powinien wystąpic bład
    fprintf("Oczekiwana wartość: %d\n",values(i));
else % Dla wielomianu stopnia 6, błąd jest nie zerowy oraz
    ... łatwy do dokładnego obliczenia
    % Dla wielomianu x^6 błąd ten powinien być równy 8/175 
    v = values(i);
    fprintf("Oczekiwana wartość: %d - %d  = %d\n",v, 8/175, v - 8/175);
end

fprintf("Obliczona wartość: %d\n\n\n\n",getScalarMult(f,p,n));

if(mod(i,3) == 0) % Co 3 iteracje powinny być zapisane 21 linie
    pause('on');
    pause();
end

end


end