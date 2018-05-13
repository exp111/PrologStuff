% Autor:
% Datum: 13.05.2018

%append(Xs,Ys,Rs) :- Dabei ergibt sich die Liste Rs durch Anhängen der Liste Ys an die Liste Xs.
app([], Ys, Ys).
app([H|Xs], Ys, [H|Rs]) :- app(Xs, Ys, Rs).

%add(A,B,R) :- A + B = R.
add(o,X,X).
add(s(A), B, s(R)) :- add(A,B,R).

%maxSymb(A,B,R) :- R = math.max(A,B).
maxSymb(A, o, A).
maxSymb(o, B, B).
maxSymb(s(A),s(B),s(R)) :- maxSymb(A,B,R).

%A25)
%tiefe(Xb, Ys) :- Ys ist die Liste der Knotenbeschriftungen des Binärbaumes Xb,
%die man bei einem depth-first left-to-right Durchlauf erhält.
%n(0, n(1, n(2, e, e), n(3,e,e)), n(4, e, n(5, e, e)))
tiefe(e, []).
tiefe(n(H, Lb, Rb),[H|Ys]) :- tiefe(Lb, Ys1), tiefe(Rb, Ys2), app(Ys1, Ys2, Ys).

%A27)
%height(Tb, N) :- N (nat. Zahl in symbolischer Darstellung) ist die Höhe des Baumes (siehe Aufgabe 7.c) T.
height(e, o).
height(n(H, Lb, Rb), s(N)) :- height(Lb, N1), height(Rb, N2), maxSymb(N1, N2, N).
%functs(Tb, N) :- N (nat. Zahl in symbolischer Darstellung) ist die Anzahl der Funktoren des Baumes (siehe Aufgabe 11.a) T.
functs(e, o).
functs(n(Root, Lb, Rb), s(N)) :- functs(Lb, N1), functs(Rb, N2), add(N1, N2, N).
%varcons(Tb,N) :- N (nat. Zahl in symbolischer Darstellung) ist die Anzahl der Variablen und Konstanten des Baumes (siehe Aufgabe 11.b) T.
varcons(e, o).
varcons(n(Root, Lb, Rb), s(N)) :- varcons(Lb, N1), varcons(Rb, N2), add(N1, N2, N).