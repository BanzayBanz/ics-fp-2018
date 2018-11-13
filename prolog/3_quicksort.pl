﻿qsort(L, K):- q_sort(L, K).

q_sort([],[]).
q_sort([Head|Tail], Sorted):-
    partion(Head, Tail, Less, More),
    q_sort(Less, SortedLess),
    q_sort(More, SortedMore),
    append(SortedLess, [Head|SortedMore], Sorted).

partion(Head, [], [], []).
partion(Head, [E|Tail], [E|Less], More):-
    E=<Head, partion(Head, Tail, Less, More).
partion(Head, [E|Tail], Less, [E|More]):-
    E>Head, partion(Head, Tail, Less, More).
