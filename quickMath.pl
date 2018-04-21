% Autor:
% Datum: 21.04.2018

plus(o,X,X).
plus(s(A), B, s(R)) :- plus(A,B,R).

minus(A,B,R) :- plus(A,B,R), minus.

mult(o,A,o).
mult(A,s(B),R) :- mult(A,B,U), plus(A,U,R).

eqZero(0).