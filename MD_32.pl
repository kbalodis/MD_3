aa(A,B,C) :-
    rmdups(A,B,X),
    list(X,C).

rmdups([],_D,[]).
rmdups([H|T],D,Vs) :-    
    rmdup(H,D,M),
    rmdups(T,D,O),
    append(M,O,Vs).

rmdup(_,[],[]).
rmdup(K,[(K,V)|P],[V|Vs]) :-
    rmdup(K,P,Vs).
rmdup(K,[(X,_)|P],Vs) :-
    dif(K,X),
    rmdup(K,P,Vs).

list([],[]).
list([X|Xs],[X|Ys]) :-
    subtract(Xs,[X],Zs),
    list(Zs,Ys).

cc(A,B,C) :-
    matching(A,B,X),
    list(X,C).

matching([],_,[]).
matching([Pair|P1], T, Z) :-
    match(Pair,T,Z1),
    matching(P1,T,Z2),
    append(Z1,Z2,Z).

match(_,[],[]).
match((K1,V1),[(K2,V2)|P2],[Pair|Z]) :-
    V1 == K2,
    Pair = (K1,V2),
    match((K1,V1), P2, Z).
match((K1,V1),[(K2,_)|P2],Z) :-
    V1 \= K2,
    match((K1,V1), P2, Z).