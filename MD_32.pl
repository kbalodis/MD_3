aa(A,B,C) :-
    rmdups(A,B,X),
    list_set(X,C).

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

list_set([],[]).
list_set([X|Xs],[X|Ys]) :-
    subtract(Xs,[X],Zs),
    list_set(Zs,Ys).

cc(A,B,C) :-
    matching(A,B,C).

matching([],_,[]).
matching(_,[],[]).
matching([],[],[]).
matching([Pair|P1], T, Z) :-
    match(Pair,T,Z),
    matching(P1,T,Z).

match(_,[],[]).
match((K1,V1),[(K2,V2)|P2],Z) :-
    V1 == K2,
    member((K1,V2),Z),
    match((K1,V1), P2, Z).