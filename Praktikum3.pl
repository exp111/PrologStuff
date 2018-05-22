% Autor:
% Datum: 22.05.2018

%Helper Start

%prefix(Xs, Ys) :- Die Liste Ys beginnt mit der Liste Xs.
prefix(Xs, Ys) :- append(Xs, Ms, Ys).

%Helper End

%1.)
%postfix(Xs,Ys) :- Ys endet mit der Liste Xs.
postfix(Xs, Ys) :- reverse(Xs, XRs), reverse(Ys, YRs), prefix(XRs, YRs).
postfix2(Xs,Ys) :- append(Fs, Xs, Ys).