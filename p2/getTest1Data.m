function [f,functions,equations,a,b,x0,xN,y0] = getTest1Data
% Projekt 2, zadanie 47
% Karol Sęk, 334831
% 
% Funkcja zwracająca dane potrzebne do wykonania testu poprawności.
% WYJŚCIE
%   f - tablica komórkowa zawierająca uchwyty do testowanych funkcji
%   functions - tablica zawierająca łancuchy znaków określających
%   funkcje z tablicy f
%   equations - tablica zawierająca łancuchy znaków określających
%   równania różniczkowe liniowe
%   a,b,x0,xN,y0 - argumenty potrzebne do wywołania funkcji runge
%   odpowiadają, więcej w runge.m

f = {@(x) x.^2 + 1,@(x) sin(x),@(x) 1./x, @(x) exp(x),@(x) x.^(1/2)};

functions = ["x^2 + 1","sin(x)","1/x", "e^x","x^(1/2)"];

equations = [
    "5y' +xy = x^3 + 11x",...
    "-y'' + y' + (x^2)y = sin(x) + cos(x) + sin(x)x^2"...
    "(x^4)y''' + (x^3)y'' + (x^2)y' + xy = -4"...
    "y(4) - y''' + y'' -y' + y = e^x"...
    "y(5) + (x^3)y''' + (x)y' = (105/32)x^(-9/2) + (7/8)x^(1/2)"];

a = {
    {@(x) x, @(x) 5},... % rząd = 1
    {@(x) x.^2,@(x) 1,@(x) -1},... % rząd = 2 
    {@(x) x, @(x) x.^2, @(x) x.^3, @(x) x.^4},... % rząd = 3
    {@(x) 1, @(x) -1, @(x) 1, @(x) -1, @(x) 1},... % rząd = 4
    {@(x) 0, @(x) x, @(x) 0, @(x) x.^3, @(x) 0, @(x) 1}}; % rząd = 5

b = {@(x) x.^3 + 11*x,...
    @(x) sin(x) + cos(x) + sin(x).*x.^2,...
    @(x) -4,...
    @(x) exp(x),...
    @(x) (105/32)*x.^(-9/2) + (7/8)*x.^(1/2)};

x0 = [-1,0,1,-1,1];

xN = [1,2*pi,2,1,2];

y0 = {2,...
    [0,1],...
    [1,-1,2],...
    [1/exp(1),1/exp(1),1/exp(1),1/exp(1)],...
    [1,1/2,-1/4,3/8,-15/16]};