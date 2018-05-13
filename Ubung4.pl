% Autor:
% Datum: 13.05.2018

%append(Xs,Ys,Rs) :- Dabei ergibt sich die Liste Rs durch Anhängen der Liste Ys an die Liste Xs.
app([], Ys, Ys).
app([H|Xs], Ys, [H|Rs]) :- app(Xs, Ys, Rs).

%A25)
%tiefe(Xb, Ys) :- Ys ist die Liste der Knotenbeschriftungen des Binärbaumes Xb,
%die man bei einem depth-first left-to-right Durchlauf erhält.
%n(0, n(1, n(2, e, e), n(3,e,e)), n(4, e, n(5, e, e)))
tiefe(e, []).
tiefe(n(H, Lb, Rb),[H|Ys]) :- tiefe(Lb, Ys1), tiefe(Rb, Ys2), app(Ys1, Ys2, Ys).