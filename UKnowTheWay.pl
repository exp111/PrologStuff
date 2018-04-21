% Autor:
% Datum: 21.04.2018

way(a,b).
way(a,c).
way(a,e).

way(b, c).
way(b, d).
way(b, e).

way(c, d).

way(e, c).
way(e, d).

weg(A, A).
weg(A, B) :- way(A, B).
weg(A, B) :- way(A, C), weg(C, B).


wegL(A, A, o).
wegL(A, B, s(L)) :- way(A,B).
wegL(A, B, L) :- way(A,C), wegL(C,B,s(L)).