% Autor:
% Datum: 09.05.2018


%Helper Start
%add(A, B, R) :- A + B = R.
add(o,X,X).
add(s(A), B, s(R)) :- add(A,B,R).

%append(Xs,Ys,Rs) :- Dabei ergibt sich die Liste Rs durch Anhängen der Liste Ys an die Liste Xs.
app(nil, Ys, Ys).
app(list(H, Xs), Ys, list(H, Rs)) :- app(Xs, Ys, Rs).

%binbaum(Bs) :- Überprüft ob Bs ein gültiger Binärbaum ist.
binbaum(e).
binbaum(n(H, Lb, Rb)) :- binbaum(Lb), binbaum(Rb).
%Helper End


%A1
%a)
%linListe(Xs) :- Xs ist eine gültige Liste.
linListe(nil).
linListe(list(X, Xs)) :- linListe(Xs).

%b)
%memberS(X, Ys) :- Ys enthält das Element X.
memberS(X, list(X, Ys)) :- linListe(Ys).
memberS(X, list(_, Ys)) :- linListe(Ys), memberS(X, Ys).

%infix(Xs, Ys) :- Ys enthält die Liste Xs
infix(Xs, Ys) :- linListe(Xs), linListe(Ys), app(M2s, _, Ys), app(_, Xs, M2s).

%A2
%n(s(s(o)), n(o, e, n(s(s(s(o))), e, e)), n(s(o), n(s(s(s(s(o)))), e, e))).
%construct(Root, Lb, Rb, Xneub) :- Xneub ist der Baum mit Wurzelbeschriftung Root, linken Teilbaum Lb, rechten Teilbaum Rb.
construct(Root, Lb, Rb, n(Root, Lb, Rb)) :- binbaum(Lb), binbaum(Rb).

%knotenanz(Xb, N) :- N ist die Anzahl der Knoten des Baumes Xb.
knotenanz(e, o).
knotenanz(n(Root, Lb, Rb), s(N)) :- binbaum(n(Root, Lb, Rb)), knotenanz(Lb, N1), knotenanz(Rb, N2), add(N1, N2, N).