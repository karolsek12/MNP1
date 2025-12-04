function TestMSE(f,N,n,m)

points = linspace(-1,1,m);

lcoeffs = apro(f,N,n);

approx = legendreEval(lcoeffs,points);
values = f(points);

error = abs(approx-values);

rel = error./abs(values);
rel(rel == Inf) = NaN;

mse = sum(error.*error)/m;

fprintf("Rozważane punkty:\n");
disp(points);
fprintf("\n Odpowiadające wartości, wykorzystany uchwyt funkcji f\n")
disp(values);
fprintf("\n Odpowiadające wartości, wykorzystana aproksymacja funkcji f\n")
disp(approx);
fprintf("\n Odpowiadające błędy bezwzględne\n")
disp(error);
fprintf("\n Odpowiadające błędy względne\n")
disp(rel);

fprintf("Błąd średniokwadratowy = %d\n", mse);

end