% Autor:
% Datum: 03.05.2018

%A20
%a)
%anz(Xs, N) :- N ist die Anzahl der Elemente in Xs.
anz(nil, o).
anz(list(X, Xs), s(N)) :- anz(Xs, N).

%b)
%prefix(Xs, Ys) :- Die Liste Xs beginnt mit der Liste Ys.
prefix(Xs, nil).
prefix(list(X, Xs), list(X, Ys)) :- prefix(Xs, Ys).

%A21
%b)
%binbaum(Bs) :- �berpr�ft ob Bs ein g�ltiger Bin�rbaum ist.
binbaum(nil).
binbaum(tree(Ls, H, Rs)) :- binbaum(Ls), binbaum(Rs).

%c)
%root(Xb,Y) : Y ist der Wurzeleintrag des Bin�rbaumes Xb.
root(tree(Ls, H, Rs), H) :- binbaum(tree(Ls, H, Rs)).

%left(Xb,Yb) : Yb ist der linke Teilbaum des Bin�rbaumes Xb.
left(tree(Yb, H, Rs), Yb) :- binbaum(tree(Yb, H, Rs)).

%right(Xb,Yb) : Yb ist der rechte Teilbaum des Bin�rbaumes Xb.
right(tree(Ls, H, Yb), Yb) :- binbaum(tree(Ls, H, Yb)).