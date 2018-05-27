% Autor:
% Datum: 22.05.2018

%Helper Start

%1.)
%prefix(Xs, Ys) :- Die Liste Ys beginnt mit der Liste Xs.
prefix(Xs, Ys) :- append(Xs, Ms, Ys).

%2.)
%binbaum(Bs) :- �berpr�ft ob Bs ein g�ltiger Bin�rbaum ist.
binbaum(e).
binbaum(n(R, Lb, Rb)) :- binbaum(Lb), binbaum(Rb).

%Helper End

%1.)
%postfix(Xs,Ys) :- Ys endet mit der Liste Xs.
postfix(Xs, Ys) :- reverse(Xs, XRs), reverse(Ys, YRs), prefix(XRs, YRs).
postfix2(Xs,Ys) :- append(Fs, Xs, Ys).

%2.)
%member(X,Xb) :- Baum Xb enth�lt den Eintrag X.
mem(X, n(X, Lb, Rb)).
mem(X, n(R, Lb, Rb)) :- binbaum(Lb), mem(X, Lb).
mem(X, n(R, Lb, Rb)) :- binbaum(Rb), mem(X, Rb).

%3.)
%preorder(Xb,Ys) : Ys ist die Liste der Knotenbeschriftungen des Bin�rbaumes Xb in Pr�order.
preorder(e, []).
preorder(n(R, Lb, Rb), [R|Ys]) :- preorder(Lb, KLs), preorder(Rb, KRs), append(KLs, KRs, Ys).

%postorder(Xb,Ys) : Ys ist die Liste der Knotenbeschriftungen des Bin�rbaumes Xb in Postorder.
postorder(e, []).
postorder(n(R, Lb, Rb), Ys) :- postorder(Lb, KLs), postorder(Rb, KRs), append(KLs, KRs, Ks), append(Ks, [R], Ys).

%roots(Xbs, Ys) :- Xbs ist eine Liste von Bin�rb�umen. Die Liste Ys ist die Liste der Wurzelbeschriftungen der Bin�rb�ume in Xbs in der richtigen Reihenfolge.
roots([], []).
roots([e|Xbs], Ys) :- roots(Xbs, Ys).
roots([n(R, Lb, Rb)|Xbs], [R|Ys]) :- roots(Xbs,Ys).