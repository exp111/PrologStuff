% Autor:
% Datum: 03.06.2018

%A16.)
%mirror(Xb,Yb) :- Yb ist der gespiegelte Baum Xb.
mirror(e, e).
mirror(n(R,Lb,Rb), n(R, RMb, LMb)) :- mirror(Lb, LMb), mirror(Rb, RMb).

%A31.) a)
%removeLastElement(Xs, Ys) :- Ys ist Xs, eine nicht leere Liste in Prolog Listennotation, ohne das letzte Element.
removeLastElement([_],[]).
removeLastElement([X|Xs],[X|Ys]) :- removeLastElement(Xs,Ys).
