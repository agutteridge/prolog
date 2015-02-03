% solve(List1, List2, List3[Lots of Lists])

% needed for first call, where first list and head of third list are equal
solve(From, To, [From|Tail]) :- 
	isNotBarrier(From),
	solveHelper(From, To, Tail).

solveHelper(From, To, [To|[]]) :- 
	isNotBarrier(To),
	isAdjacent(From, To),
	!.

solveHelper(From, To, [Next|Tail]) :-
	isNotBarrier(Next),
	isAdjacent(From, Next),
	solveHelper(Next, To, Tail).

% subgoal met if point at coordinates (H, W) is not a barrier
isNotBarrier([H|W]) :- isNotBarrier(H, W).
isNotBarrier(H,W) :-
	getLast(W, Width),
	\+(barrier(H, Width)).

% required for isNotBarrier/2
getLast([T], T) :- !.
getLast([_|Tail], T) :- getLast(Tail, T).

% are 2 points adjacent?
isAdjacent([H1|T1], [H2|T2]) :-
	getLast(T1, N1),
	getLast(T2, N2),
	isAdjacent(H1, N1, H2, N2).
isAdjacent(H, T1, H, T2) :- 
	T1 is T2 + 1; 
	T1 is T2 - 1.
isAdjacent(H1, T, H2, T) :- 
	H1 is H2 + 1; 
	H1 is H2 - 1.