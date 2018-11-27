% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([], L2, L2).
mrg(L1, [], L1).

mrg([H1|T1], [H2|T2], [H1|T]):-
	H1 < H2,
	mrg(T1, [H2|T2], T).

mrg([H1|T1], [H2|T2], [H2|T]):-
	H1 >= H2,
	mrg([H1|T1], T2, T).


/* Results:

1 ?- mrg([],[1,2,3],R).
R = [1, 2, 3] .

2 ?- mrg([1,2,3],[],R).
R = [1, 2, 3] .

3 ?- mrg([2,4,6,8],[1,3,7,8,10],R).
R = [1, 2, 3, 4, 6, 7, 8, 8, 10] .

*/