%Are given n points in a plan (represented using its coordinates). Write
% a predicate to determine all
%subsets of collinear points.


collinear([X1,Y1],[X2,Y2],[X3,Y3]):- X1 =\= X2,X2 =\= X3,Y1 =\= Y2,Y2=\=Y3,Y1=\=Y3,X1 =\= X3,(Y2-Y1)*(X3-X1) =:= (Y3-Y1)*(X2-X1).
collinear([A,B,C|L]):- collinear(A,B,C), collinear([B,C|L]).
chooseRand([H|T],H,T).
chooseRand([_|T],R,RT):- chooseRand(T,R,RT).

subs([A,B,C],[A,B,C]):- collinear(A,B,C).
subs([_|L],S):- subs(L,S).
subs([A|L],[A|S]):- subs(L,S), collinear([A|S]).

remove(E,[],[]).
remove(E,[H|T],T):- subset(E,H),!, remove(E,T,R).
remove(E,[H|T],[H|R]):- not(subset(E,H)),remove(E,T,R).
back(L,[A,B,C]):- chooseRand(L,A,S),chooseRand(S,B,P),chooseRand(P,C,X),collinear(A,B,C).
