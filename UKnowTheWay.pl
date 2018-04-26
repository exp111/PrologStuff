% Autor:
% Datum: 21.04.2018

way(a,b).
way(a,c).
%way(a,d). commented out
way(a,e).

way(b, c).
way(b, d).
way(b, e).

way(c, d).

way(e, c).
way(e, d).

%weg(A, B) :- Es existiert ein Weg von A nach B
weg(A, A).
weg(A, B) :- way(A, C), weg(C, B).

%wegL(A, B, s(L)) :- Es existiert ein Weg von A nach B mit einer Weglänge von L
wegL(A, A, o).
wegL(A, B, s(L)) :- way(A, C), wegL(C, B, L).