% Autor:
% Datum: 09.05.2018

%A1
%a)
%linListe(Xs) :- Xs ist eine gültige Liste.
linListe(nil).
linListe(list(X, Xs)) :- linListe(Xs).

%b)
%memberS(X, Ys) :- Ys enthält das Element X.
memberS(X, list(X, Ys)).
memberS(X, list(Y, Ys)) :- memberS(X, Ys).

%infix(Xs, Ys) :- Ys enthält die Liste Xs
infix(nil, Ys).
infix(list(X, Xs), list(X, Ys)) :- infix(Xs, Ys).
infix(Xs, list(Y, Ys)) :- infix(Xs, Ys).

%A2
%n(s(s(o)), n(o, e, n(s(s(s(o))), e, e)), n(s(o), n(s(s(s(s(o)))), e, e))).
%construct(Root, Lb, Rb, Xneub) :- Xneub ist der Baum mit Wurzelbeschriftung Root, linken Teilbaum Lb, rechten Teilbaum Rb.
construct(Root, Lb, Rb, n(Root, Lb, Rb)).

%Helper Start
%plus(A, B, R) :- A + B = R.
plus(o,X,X).
plus(s(A), B, s(R)) :- plus(A,B,R).
%Helper End

%knotenanz(Xb, N) :- N ist die Anzahl der Knoten des Baumes Xb.
knotenanz(e, o).
knotenanz(n(Root, Lb, Rb), s(N)) :- knotenanz(Lb, N1), knotenanz(Rb, N2), plus(N1, N2, N).