function TestgetLegendrePolyBase()

n = 5;
expected = [ 
[1,0,0,0,0,0]
[0,1,0,0,0,0]
[-1/2,0,3/2,0,0,0]
[0,-3/2,0,5/2,0,0]
[3/8,0,-30/8,0,35/8,0]
[0,15/8,0,-70/8,0,63/8]
]';

L = getLegendrePolyBase(n);

fprintf("Test dla n = 5\n");
fprintf("Oczekiwany wynik:\n");
disp(expected);
fprintf("Obliczony wynik:\n");
disp(L);

end