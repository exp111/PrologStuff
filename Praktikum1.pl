% Autor:
% Datum: 02.05.2018

vater(thomas, tim).
vater(thomas, oliver).
vater(friedrich, claudia).
vater(friedrich, iris).
vater(friedrich, petra).

mutter(claudia, tim).
mutter(claudia, oliver).
mutter(adelgunde, claudia).
mutter(adelgunde, iris).
mutter(adelgunde, petra).
mutter(petra, bjorn).
mutter(petra, nadja).

mannlich(thomas).
mannlich(tim).
mannlich(oliver).
mannlich(bjorn).

%weiblich(W) :- W ist weiblich
weiblich(W) :-not(mannlich(W)).

%elternteil(E, K) :- E ist ein Elternteil von K
elternteil(E, K) :- mutter(E, K).
elternteil(E, K) :- vater(E, K).

%sohn(S, E) :- S ist der Sohn von E
sohn(S, E) :- mannlich(S), elternteil(E, S).

%tochter(T, E) :- T ist die Tochter von E
tochter(T, E) :- weiblich(T), elternteil(E, T).

%bruder(K, B) :- B ist der Bruder von K
bruder(K, B) :- vater(V, K), vater(V, B), mutter(M, K), mutter(M, B), mannlich(B), K \= B.

%schwester(K, S) :- S ist die Schwester von K
schwester(K, S) :- vater(V, K), vater(V, S), mutter(M, K), mutter(M, S), weiblich(S), K \= S.

%geschwister(K, G) :- G ist ein bruder/eine schwester von K
geschwister(K, G) :- bruder(K, G).
geschwister(K, G) :- schwester(K, G).

%onkel(O, N) :- O ist der Onkel von N
onkel(O, N) :- geschwister(O, G), elternteil(G, N), mannlich(T).

%tante(T, N) :- T ist die Tante von N
tante(T, N) :- geschwister(T, G), elternteil(G, N), weiblich(T).

%cousin(K, C) :- C ist ein cousin von K
cousin(K, C) :- elternteil(E1, K), geschwister(E1, E2), elternteil(E2, C), mannlich(C).

%cousine(K, C) :- C ist ein cousine von K
cousine(K, C) :- elternteil(E1, K), geschwister(E1, E2), elternteil(E2, C), weiblich(C).