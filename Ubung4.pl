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


%A28)
%selectL(X, Xs, Ys) :- Die Listen Ys ergeben sich aus der Liste Xs durch einmaliges Entfernen von X an beliebiger Stelle.
selectL(X, [X|Xs], Xs).
selectL(X, [H|Xs], [H|Ys]) :- selectL(X, Xs, Ys).

%insert(X, Xs, Ys) :- Die Listen Ys ergeben sich aus der Liste Xs durch einmaliges Einfügen von X an beliebiger Stelle.
insert(X, Xs, [X|Xs]).
insert(X, [H|Xs], [H|Ys]) :- insert(X, Xs, Ys).

%permutationL(Xs, Ys) :- Die Listen Ys sind jeweils eine Permutation der Liste Xs.
permutationL([H|Xs], Ys) :- insert(H, Xs, Ys).
permutationL([H|Xs], [H|Ys]) :- permutationL(Xs, Ys).


%A29)
%invListNum(list(s(H), list(H, T))) :- list enthält die ersten natürlichen Zahlen in numerischer Darstellung in umgekehrter Reihenfolge aufsteigend
invListNum([0]).
invListNum([1,0]).
invListNum([H1|[H2|Ts]]) :- H1 is H2 + 1, invListNum([H, T]).


%A30)
%listLength(Xs,N) :- Die natürliche Zahl N ist die Länge der Liste Xs in numerischer Darstellung.
listLength([],0).
listLength([X|Xs],N) :- listLength(Xs, N1), N is N1 + 1.

%anz(X,Xs,N) :- Die natürliche Zahl N ist die Häufigkeit des Auftretens von X in Xs in numerischer Darstellung.
anz(X, [], 0).
anz(X,[X|Xs],N) :- anz(X, Xs, N1), N is N1 + 1.
anz(X,[H|Xs],N) :- anz(X, Xs, N).