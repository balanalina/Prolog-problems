%remove the min element from a list
min([X],X).
min([H|T],H):- min(T,X),X>=H,!.
min([H|T],X):- min(T,X),H>=X.
remove(E,[],[]).
remove(E,[H|T],T):- H = E,!, remove(E,T,R).
remove(E,[H|T],[H|R]):- H =\= E,remove(E,T,R).
sorting([],[]).
sorting(L,[X|R]):- min(L,X),remove(X,L,L2), sorting(L2,R).

