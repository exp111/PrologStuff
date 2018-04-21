% Autor:
% Datum: 21.04.2018

plus(o,X,X).
plus(s(A), B, s(R)) :- plus(A,B,R).

minus(A,B,R) :- plus(B,R,A).