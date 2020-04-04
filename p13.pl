%  Given a linear numerical list write a predicate to remove all
%sequences of consecutive values.
%Eg.: remove([1, 2, 4, 6, 7, 8, 10], L) will produce L=[4, 10].
%  For a heterogeneous list, formed from integer numbers and list of
%numbers; write a predicate to delete from
%every sublist all sequences of consecutive values.
%Eg.: [1, [2, 3, 5], 9, [1, 2, 4, 3, 4, 5, 7, 9], 11, [5, 8, 2], 7] =>
%[1, [5], 9, [4, 7, 9], 11, [5, 8, 2], 7]

%checks if P and S are consecutive
%consecutive(P,S)
%flow model(i,i)
consecutive(P,S):- S is P+1.
%remove all sequences of consecutive values
%removeSeq(L: list, R: result list)
%flow model (i,o)
removeSeq([],[]).
removeSeq([H1,H2],[]):- consecutive(H1,H2).
removeSeq([H1,H2],[H1,H2]):- not(consecutive(H1,H2)).
removeSeq([H1,H2,H3],[H1,H2,H3]):- not(consecutive(H1,H2)),
    not(consecutive(H2,H3)).
removeSeq([H1,H2,H3],[H3]):- consecutive(H1,H2),
    not(consecutive(H2,H3)).
removeSeq([H1,H2,H3|T],[H1,H2|R]):- not(consecutive(H1,H2)),
    not(consecutive(H2,H3)), removeSeq([H3|T],R).
removeSeq([H1,H2,H3|T],R):- consecutive(H1,H2), not(consecutive(H2,H3)),
    removeSeq([H3|T],R).
removeSeq([H1,H2,H3|T],R):- consecutive(H1,H2), consecutive(H2,H3),
    removeSeq([H3|T],R).
removeSeq([H1,H2,H3|T],[H1|R]):- not(consecutive(H1,H2)),
    consecutive(H2,H3), removeSeq([H3|T],R).
removeAll([],[]).
removeAll([H|T],[H|R]):- not(is_list(H)),
    removeAll(T,R).
removeAll([H|T],[L|R]):- is_list(H),
    removeSeq(H,L), removeAll(T,R).


