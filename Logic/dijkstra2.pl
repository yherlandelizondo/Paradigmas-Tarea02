:- module(dijkstra_av, [dijkstra_av/3,
            dijkstra_edges/3]).

dijkstra_av(Graph, Start, Solution) :-
    setof(X, Y^D^(member(d(X,Y,D), Graph) ; member(d(Y,X,D), Graph)), Xs),
    length(Xs, L),
    length(Vs, L),
    aggregate_all(sum(D), member(d(_, _, D), Graph), Infinity),
    catch((algo(Graph, Infinity, Xs, Vs, Start, Solution),
           throw(sol(Solution))
          ), sol(Solution), true).

dijkstra_edges(Graph, Start, Edges) :-
    dijkstra_av(Graph, Start, Solution),
    maplist(nodes_to_edges(Graph), Solution, Edges).

algo(Graph, Infinity, Xs, Vs, Start, Solution) :-
    pairs_keys_values(Ps, Xs, Vs),
    maplist(init_adjs(Ps), Graph),
    maplist(init_dist(Infinity), Ps),
    %ord_memberchk(Start-Sv, Ps),
    memberchk(Start-Sv, Ps),
    put_attr(Sv, dist, 0),
    time(main_loop(Vs)),
    maplist(solution(Start), Vs, Solution).

solution(Start, V, (N, D, [Start|P])) :-
    get_attr(V, name, N),
    get_attr(V, dist, D),
    rpath(V, [], P).

rpath(V, X, P) :-
    get_attr(V, name, N),
    (   get_attr(V, previous, Q)
    ->  rpath(Q, [N|X], P)
    ;   P = X
    ).

init_dist(Infinity, N-V) :-
    put_attr(V, name, N),
    put_attr(V, dist, Infinity).

init_adjs(Ps, d(X, Y, D)) :-
    memberchk(X-Xv, Ps),
    memberchk(Y-Yv, Ps),
    adj_add(Xv, Yv, D),
    adj_add(Yv, Xv, D).

adj_add(X, Y, D) :-
    (   get_attr(X, adjs, L)
    ->  put_attr(X, adjs, [Y-D|L])
    ;   put_attr(X, adjs, [Y-D])
    ).

main_loop([]).
main_loop([Q|Qs]) :-
    smallest_distance(Qs, Q, U, Qn),
    put_attr(U, assigned, true),
    get_attr(U, adjs, As),
    update_neighbours(As, U),
    main_loop(Qn).

smallest_distance([A|Qs], C, M, [T|Qn]) :-
    get_attr(A, dist, Av),
    get_attr(C, dist, Cv),
    (   Av < Cv
    ->  (N,T) = (A,C)
    ;   (N,T) = (C,A)
    ),
    !, smallest_distance(Qs, N, M, Qn).
smallest_distance([], U, U, []).

update_neighbours([V-Duv|Vs], U) :-
    (   get_attr(V, assigned, true)
    ->  true
    ;   get_attr(U, dist, Du),
        get_attr(V, dist, Dv),
        Alt is Du + Duv,
        (   Alt < Dv
        ->  put_attr(V, dist, Alt),
        put_attr(V, previous, U)
        ;   true
        )
    ),
    update_neighbours(Vs, U).
update_neighbours([], _).


%Distancias del grafo
%San José
d('San José','Cartago',20).
d('San José','Corralillo',22).
%Corralillos
d('Corralillos','San José',22).
d('Corralillos','Musgo Verde',6).
%Musgo Verde
d('Musgo Verde','Corralillo',6).
d('Musgo Verde','Cartago',10).
%Cartago
d('Cartago','Musgo Verde',10).
d('Cartago','San José',20).
d('Cartago','Paraíso',10).
d('Cartago','Tres Ríos',8).
d('Cartago','Pacayas',13).
%Tres Ríos
d('Tres Ríos','Pacayas',15).
d('Tres Ríos','San José',8).
%Pacayas
d('Pacayas','Tres Ríos',15).
d('Pacayas','Cartago',13).
d('Pacayas','Cervantes',8).
%Paraíso
d('Paraíso','Cervantes',4).
d('Paraíso','Cachí',10).
d('Paraíso','Orosi',8).
%Cervantes
d('Cervantes','Juan Viñas',5).
d('Cervantes','Pacayas',8).
d('Cervantes','Cachí',7).
%Orosi
d('Orosi','Paraíso',8).
d('Orosi','Cachí',12).
%Juan Viñas
d('Juan Viñas','Turrialba',4).
%Cachí
d('Cachí','Turrialba',40).
d('Cachí','Cervantes',7).
d('Cachí','Paraíso',10).
d('Cachí','Orosi',12).
%Turrialba
d('Turrialba','Cachí',40).
d('Turrialba','Pacayas',18).

alldistances(List):- findall(Hecho,(d(X,Y,Z),Hecho = d(X,Y,Z)), List).

routeaux(X, [X|_]).
routeaux(X, [_|Y]):- routeaux(X, Y).

route(Inicio,Fin,T,R):-
    alldistances(List),
   dijkstra_av(List,Inicio,X),
   routeaux((Fin,T,R), X).

finalanswer(Inicio,Fin):-
    route(Inicio,Fin,T,R),
    write('La ruta más rápida es '),write(R), write(' con una duración de '), write(T),write(' minutos'),nl.
