% Autor:
% Datum: 02.05.2018

vater(thomas, tim).
vater(thomas, oliver).
vater(friedrich, claudia).
vater(friedrich, iris).

mutter(claudia, tim).
mutter(claudia, oliver).
mutter(adelgunde, claudia).
mutter(adelgunde, iris).

mannlich(thomas).
mannlich(tim).
mannlich(oliver).

%weiblich(W) :- W ist weiblich
weiblich(W) :-not(mannlich(W)).

%elternteil(E, K) :- E ist ein Elternteil von K
elternteil(E, K) :- mutter(E, K).
elternteil(E, K) :- vater(E, K).

%sohn(S, E) :- S ist der Sohn von E
sohn(S, E) :- mannlich(S), elternteil(E, S).

%tochter(T, E) :- T ist die Tochter von E
tochter(T, E) :- weiblich(T), elternteil(E, T).

%bruder(K, B) :- K ist der Bruder von B
bruder(K, B) :- vater(V, K), vater(V, B), mutter(M, K), mutter(M, B), mannlich(B), K \= B.

%schwester(K, S) :- K ist die Schwester von S
schwester(K, S) :- vater(V, K), vater(V, S), mutter(M, K), mutter(M, S), weiblich(S), K \= S.

%geschwister(K, G) :- K ist ein Bruder/Schwester von G
geschwister(K, G) :- bruder(K, G).
geschwister(K, G) :- schwester(K, G).

%onkel(O, N) :- O ist der Onkel von N
onkel(O, N) :- geschwister(O, G), elternteil(G, N), mannlich(T).

%tante(T, N) :- T ist die Tante von N
tante(T, N) :- geschwister(T, G), elternteil(G, N), weiblich(T).