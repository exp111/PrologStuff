% Autor:
% Datum: 21.06.2018
   /*
%zustand(S) :- Endliche Menge der Zustände.
zustand(z0).
zustand(z1).

%eingabe(E) :- E ist das Eingabealphabet.
eingabe(0).
eingabe(1).

%keller(K) :- K ist
keller(0).
keller(1).
keller(sharp).

%startZustand(S) :- S ist der Startzustand.
startZustand(z0).

%kellerSymbol(K) :- K ist das Kellersymbol.
kellerSymbol(sharp).

%Transitionsrelationen
%1. Hälfte
delta(z0, 1, sharp, z0, [1, sharp]).
delta(z0, 1, 0, z0, [1, 0]).
delta(z0, 1, 1, z0, [1, 1]).

delta(z0, 0, sharp, z0, [0, sharp]).
delta(z0, 0, 0, z0, [0, 0]).
delta(z0, 0, 1, z0, [0, 1]).

%Übergang
delta(z0, nix, sharp, z1, [sharp]).
delta(z0, nix, 0, z1, [0]).
delta(z0, nix, 1, z1, [1]).

%2. Hälfte
delta(z1, 1, 1, z1, []).
delta(z1, 0, 0, z1, []).
delta(z1, nix, sharp, z1, []). */

%zustand(S) :- Endliche Menge der Zustände.
zustand(z).

%eingabe(E) :- E ist das Eingabealphabet.
eingabe(0).
eingabe(1).

%keller(K) :- K ist
keller(0).
keller(1).
keller(s).

%startZustand(S) :- S ist der Startzustand.
startZustand(z).

%kellerSymbol(K) :- K ist das Kellersymbol.
kellerSymbol(s).

%Transitionsrelationen
delta(z, 0, 0, z, []).
delta(z, 1, 1, z, []).

delta(z, nix, s, z, []).
delta(z, nix, s, z, [0]).
delta(z, nix, s, z, [1]).
delta(z, nix, s, z, [0,s,0]).
delta(z, nix, s, z, [1,s,1]).


%lvonM(Ws) :- Ws ist ein Wort der von M erkannten Sprache.
lvonM(Ws) :- startZustand(Sz), kellerSymbol(K), es_plus(Sz, Ws, [K], Sn, Kn), sigma_stern(Ws).

%es() :- Einzelschrittrelation.
es(S, W, [K|Ks], Sn, Kn) :- delta(S, W, K, Sn, Kr), append(Kr, Ks, Kn).

%es_plus() :- Transitiver Abschluss der Einzelschrittrelationen.
es_plus(E, [], [], E, []).
es_plus(S, Ws, Ks, Sn, Kn) :- es(S, nix, Ks, Sn, Kn), es_plus(Sn, Ws, Kn, Sn2, Kn2).
es_plus(S, [W|Ws], Ks, Sn, Kn) :- es(S, W, Ks, Sn, Kn), es_plus(Sn, Ws, Kn, Sn2, Kn2).

%sigma_stern(Ws) :- Menge der Wörter über Sigma.
sigma_stern([]).
sigma_stern([W|Ws]) :- eingabe(W), sigma_stern(Ws).