% Autor:
% Datum: 21.04.2018

plus(o,X,X) :- natSymb(X).
plus(s(A), B, s(R)) :- natSymb(A), natSymb(B), plus(A,B,R).

minus(A,B,R) :- plus(B,R,A).

mult(A,o,o) :- natSymb(A).
mult(A,s(B),R) :- natSymb(A), natSymb(B), mult(A,B,U), plus(A,U,R).

eqZero(0).

square(X,Y) :- natSymb(X), natSymb(Y), mult(X,X,Y).

natSymb(o).
natSymb(s(X)) :- natSymb(X).