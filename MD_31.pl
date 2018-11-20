dontIntersect(L1,L2) :-
    intersection(L1,L2,[]).

dontIntersectE(L1,L2,L3,K) :-
    append(L2,L3,J),
    subtract(L1,J,K).

subsetE2([], R, R).
subsetE2([H | T], List, R):-
    select(H, List, NewList1),
    select(H, NewList1, NewList2),
    subsetE2(T, NewList2, R).

subsetE(L1, L2):-
    subsetE2(L1,L2,Remainder),
    dontIntersect(L1,Remainder).

p(A,B,C,D,E):-
   intersection(A,B,X1),
   permutation(D,X1),
   dontIntersectE(A,B,C,Y1),
   subsetE(Y1,E).
