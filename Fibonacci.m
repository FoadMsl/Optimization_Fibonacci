% =================================================
%       Foad Moslem (foad.moslem@gmail.com) - Researcher | Aerodynamics
%       Using MATLAB R2022a
% =================================================
clc
clear
close all

% =================================================
tic
global numFunc
numFunc = 0;

% Curve Ploting ======================================
a = 0;
b = 4;
NumOfNodes = 200;
x = linspace(a,b,NumOfNodes);
y = ObjFun(x);
plot(x,y)
hold on

% Main Code - Fibonacci ===============================
%{
Value of n	    Fibonacci Number, Fn	    Reduction Ratio, Ln/L0      epsilon
0	                    1	                                        1
1	                    1	                                        1
2	                    2	                                        0.5
3	                    3	                                        0.3333
4	                    5	                                        0.2
5	                    8	                                        0.125                                      ~1e-1
6	                    13	                                    0.07692
7	                    21	                                    0.04762
8	                    34	                                    0.02941
9	                    55	                                    0.01818
10	                89	                                    0.01124                                 ~1e-2
11	                144	                                    0.006944
12	                233	                                    0.004292
13	                377	                                    0.002653
14	                610	                                    0.001639
15	                987	                                    0.001013                               ~1e-3
16	                1,597	                                0.0006406
17	                2,584	                                0.000387
18	                4,181	                                0.0002392
19	                6,765	                                0.0001479
20	                10,946	                            0.00009135                           ~1e-4
25                                                                                                                ~1e-5
30                                                                                                                ~1e-6
%}
a1 = a;
b1 = b;
%epsilon = 1e-3
n = 30; % Fibonacci Order
N = n+1;
l = abs(a1-b1);
l1 = (fibonacci(N-2)/fibonacci(N))*l;
j=2;

while j < N
    l = abs(a1-b1);
    if l1 > l/2
        x1 = b1 - l1;
        x2 = a1 + l1;
    elseif l1 <= l/2
        x1 = a1 +l1;
        x2 = b1 - l1;
    end
    fx1 = ObjFun(x1);
    fx2 = ObjFun(x1);
    if fx1 > fx2
        a1= x1;
        l1 = (f(N-j)/f(N-(j-2)))*abs(a1-b1);
    elseif fx2 > fx1
        b1 = x2;
        l1 = (f(N-j)/f(N-(j-2)))*abs(a1-b1);
    else
        a1 = x1;
        b1 = x2;
        l1 = (fibonacci(N-2)/fibonacci(N))*abs(a1-b1);
        j = j+1;
    end
    j = j+1;
end
xm = (a1+b1)/2;
fxm = ObjFun(xm);
% =================================================
fprintf('Number of CallFunction: %6.f\n',numFunc)
fprintf('CPU time: %6.4f\n',toc)
fprintf('X Value of Optimum Point: %6.4f\n',xm)
fprintf('Y Value of Optimum Point: %6.4f\n',fxm)
plot(xm,fxm,'kx')