% Write a predicate to determine the difference of two sets.
% Write a predicate to add value 1 after every even element from a
%list

%add(l:list) - adds 1 after every even element
%flow model: (i)
%end of recursion
add([],[]).
%we add 1 after the head element and continue the recursion
add([H|T],[H,1|R]):- REST is H mod 2, REST= 0, add(T,R).
%we don't add 1 after the head and continue the recursion
add([H|T],[H|R]):-  REST is H mod 2, REST \= 0, add(T,R).
% ocurrence(List,elemnt,counter: integer)- counts the ocurrences of
% element in List
%flow model: ocurrence(i,i,o).
%end of recursion
occurence([],_,0).
occurence([H|T],E,C):- H = E , occurence(T,E,C1), C is C1+1.
occurence([H|T],E,C):- H \= E, occurence(T,E,C).
%differnce(Set1 :set, L: set, R : list) - R is the result of Set1 - L
%flow model: differnce(i,i,o).
%end of recursion
difference([],_,[]).
% we don't add the head in the resulting list but we continue the
% recursion
difference([H|T],L,R):-  occurence(L,H,C),
    C > 0,  difference(T,L,R).
%we add the head in resulting list and we continue the recursion
difference([H|T],L,[H|R]):- occurence(L,H,0),
    difference(T,L,R).

