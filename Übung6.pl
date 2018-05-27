% Autor:
% Datum: 27.05.2018

%rS(Ws) :- Ws ist in L(G).
rS([tick|Ls]) :- rL(Ls).
rL([tack]).
rL([tack|As]) :- rA(As).
rA([tick]).
rA([tick|Ls]) :- rL(Ls).