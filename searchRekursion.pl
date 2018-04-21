% Autor:
% Datum: 11.04.2018

search(ToSearch, [ToSearch|T]). /* Check if head == ToSearch */
search(ToSearch, [H|T]) :- writeln(T), search(ToSearch, T).

list(X,Y).
searchL(X, list(X,T)).
searchL(X, X).
searchL(X, list(H,T)) :- searchL(X, T).