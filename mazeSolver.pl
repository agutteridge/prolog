% solve(List1, List2, List3[Lots of Lists])

solve(From, To, To) :- 
	isAdjacent(From, To),
	isNotBarrier(From),
	!.

solve([FromH|FromT], To, [[FromH|FromT]|[]]) :- 
	% change to isNotBarrier([PointH|PointT])?
	isNotBarrier(FromH,FromT),
	solve(Point, To, [FromH|FromT]).

solve(From, To, [From|[Next|Tail]]) :- 
	isNotBarrier(From),

	solve(Point, To, Tail).

% subgoal met if point at coordinates (H, W) is not a barrier
isNotBarrier([H|W]) :- isNotBarrier(H, W).
isNotBarrier(H,W) :-
	getLast(W, Width),
	\+(barrier(H, Width)).

% required for isNotBarrier/2
getLast([T], T) :- !.
getLast([_|Tail], T) :- getLast(Tail, T).

% are 2 points adjacent?
isAdjacent([H1|[T1]], [H2|[T2]]) :- 
	isAdjacent([H1|T1], [H2|T2]).
isAdjacent([H|T1], [H|T1 + 1]).
isAdjacent([H|T1], [H|T2 - 1]).
isAdjacent([H|T], [H + 1|T]).
isAdjacent([H|T], [H - 1|T]).