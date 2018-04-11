% Autor:
% Datum: 11.04.2018

taller(bob, mike).
taller(mike, jim).
taller(jim, george).

isTaller(X,Y) :- taller(X,Y).
isTaller(X,Y) :- taller(X,Z), isTaller(Z,Y).