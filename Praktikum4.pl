% Autor:
% Datum: 06.06.2018

%A1.)
%a)     Nur Fakten; Keine Variablen
%eZustandsmenge(Ss) :- Ss ist die endliche Zustandsmenge.
eZustandsmenge([z0,z1,z2,z3]).

%eAlphabet(Sigmas) :- Sigmas ist das Eingabealphabet.
eAlphabet([0,1]).

%delta(S,U,N) :- S ist der jetztige Zustand, U der Übergangswert, N der nächste Zustand.
delta(z0,0,z0).
delta(z0,0,z1).
delta(z0,1,z0).

delta(z1,1,z2).
delta(z2,0,z3).


%startZMenge(S0s) :- S0s (Element von Zs s.o.) ist die Startzustandsmenge.
startZMenge([z0]).

%endZMenge(Es) :- Es ist die Endzustandsmenge.
endZMenge([z3]).

%b)
%delta_stern(Zakt,Ws,Zneu) :- Erweiterung der Transitionsrelation delta(S,U,N).
delta_stern(S,[], S) :- endZMenge([S]).
delta_stern(S,[W|Ws],N) :- delta(S, W, N1), delta_stern(N1, Ws, N).


%lvonN(Ws) :- Ws ist ein Wort in der Sprache aus a).
lvonN(Ws) :- startZMenge([S]), endZMenge([E]), delta_stern(S, Ws, E).