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

%log(A, B, R) :- log(A) zur Basis von B = R
log(A, B, R) :- natSymb(A), natSymb(B), exp(B ,R, A).

%natList(list(H, T)) :- list enth�lt nur nat�rliche Symbole
natList(nil).
natList(list(H, T)) :- natSymb(H), natList(T).

%invList(list(s(H), list(H, T))) :- list enth�lt die ersten nat�rlichen Zahlen als Symbole in umgekehrter Reihenfolge aufsteigend
invList(list(o, nil)).
invList(list(s(H), list(H, T))) :- natList(list(H, T)), invList(list(H, T)).

%head(Xs, X) :- X ist das erste Element der Liste Xs.
head(list(X, Xs), X).

%tail(Xs, Ys) :- Ys ist die Liste Xs ohne deren erstes Element.
tail(list(H, Ys), Ys).

%append(Xs,Ys,Rs) :- Dabei ergibt sich die Liste Rs durch Anh�ngen der Liste Ys an die Liste Xs.