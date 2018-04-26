% Autor:
% Datum: 21.04.2018

plus(o,X,X) :- natSymb(X).
plus(s(A), B, s(R)) :- natSymb(A), natSymb(B), plus(A,B,R).

minus(A,B,R) :- plus(B,R,A).
halbieren(A, R) :- plus(R, R, A).

mult(A,o,o) :- natSymb(A).
mult(A,s(B),R) :- natSymb(A), natSymb(B), mult(A,B,U), plus(A,U,R).

eqZero(0).
neqZero(X) :- natSymb(X), plus(o, X, s(_)).
less(X,Y) :- natSymb(X), natSymb(Y), plus(X,R,Y), eqZero(R).
lessEqual(X,Y) :- natSymb(X), natSymb(Y), plus(X,R,Y).
square(X,Y) :- natSymb(X), natSymb(Y), mult(X,X,Y).

natSymb(o).
natSymb(s(X)) :- natSymb(X).

%exp(A, s(B), R) :- A^B = R
exp(A, o, s(o)).
exp(A, s(B), R) :- natSymb(A), natSymb(B), exp(A, B, U), mult(A,U,R).