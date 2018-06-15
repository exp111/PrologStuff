% Autor:
% Datum: 06.06.2018

%A1.)
%a)     Nur Fakten; Keine Variablen
%eZustandsmenge(S) :- S ist die endliche Zustandsmenge.
eZustandsmenge(z0).
eZustandsmenge(z1).
eZustandsmenge(z2).
eZustandsmenge(z3).

%eAlphabet(Sigmas) :- Sigmas ist das Eingabealphabet.
eAlphabet(0).
eAlphabet(1).

%delta(S,U,N) :- S ist der jetztige Zustand, U der Übergangswert, N der nächste Zustand.
delta(z0,0,z1).
delta(z0,0,z0).
delta(z0,1,z0).

delta(z1,1,z2).
delta(z2,0,z3).


%startZMenge(S0) :- S0 (Element von Zs s.o.) ist die Startzustandsmenge.
startZMenge(z0).

%endZMenge(E) :- E ist die Endzustandsmenge.
endZMenge(z3).

%b)
%delta_stern(Zakt,Ws,Zneu) :- Erweiterung der Transitionsrelation delta(S,U,N).
delta_stern(S,[], S).
delta_stern(S,[W|Ws],N) :- delta(S, W, N1), delta_stern(N1, Ws, N).


%lvonN(Ws) :- Ws ist ein Wort in der Sprache aus a).
lvonN(Ws) :- startZMenge(S), endZMenge(E), delta_stern(S, Ws, E), sigma_stern(Ws).

%sigma_stern(Ss) :- Ss ist ein Wort des Eingangsalphabets.
sigma_stern([]).
sigma_stern([W|Ws]) :- eAlphabet(W), sigma_stern(Ws).