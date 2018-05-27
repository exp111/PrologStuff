% Autor:
% Datum: 22.05.2018

%Helper Start

%1.)
%prefix(Xs, Ys) :- Die Liste Ys beginnt mit der Liste Xs.
prefix(Xs, Ys) :- append(Xs, Ms, Ys).

%2.)
%binbaum(Bs) :- Überprüft ob Bs ein gültiger Binärbaum ist.
binbaum(e).
binbaum(n(R, Lb, Rb)) :- binbaum(Lb), binbaum(Rb).

%Helper End

%1.)
%postfix(Xs,Ys) :- Ys endet mit der Liste Xs.
postfix(Xs, Ys) :- reverse(Xs, XRs), reverse(Ys, YRs), prefix(XRs, YRs).
postfix2(Xs,Ys) :- append(Fs, Xs, Ys).

%2.)
%member(X,Xb) :- Baum Xb enthält den Eintrag X.
mem(X, n(X, Lb, Rb)).
mem(X, n(R, Lb, Rb)) :- binbaum(Lb), mem(X, Lb).
mem(X, n(R, Lb, Rb)) :- binbaum(Rb), mem(X, Rb).

%3.)
%preorder(Xb,Ys) : Ys ist die Liste der Knotenbeschriftungen des Binärbaumes Xb in Präorder.
preorder(e, []).
preorder(n(R, Lb, Rb), [R|Ys]) :- preorder(Lb, KLs), preorder(Rb, KRs), append(KLs, KRs, Ys).

%postorder(Xb,Ys) : Ys ist die Liste der Knotenbeschriftungen des Binärbaumes Xb in Postorder.
postorder(e, []).
postorder(n(R, Lb, Rb), Ys) :- postorder(Lb, KLs), postorder(Rb, KRs), append(KLs, KRs, Ks), append(Ks, [R], Ys).

%roots(Xbs, Ys) :- Xbs ist eine Liste von Binärbäumen. Die Liste Ys ist die Liste der Wurzelbeschriftungen der Binärbäume in Xbs in der richtigen Reihenfolge.
roots([], []).
roots([e|Xbs], Ys) :- roots(Xbs, Ys).
roots([n(R, Lb, Rb)|Xbs], [R|Ys]) :- roots(Xbs,Ys).