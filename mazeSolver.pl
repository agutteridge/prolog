% solve(List1, List2, List3[Lots of Lists])

solve(Point, [ToH|ToT], [ToH|ToT]) :- !.

solve([FromH|FromT], To, [[FromH|FromT]|[]]) :- 
	isNotBarrier(FromH,FromT),
	solve(Point, To, [FromH|FromT]).

solve([FromH|FromT], To, [[FromH|FromT]|Tail]) :- 
	isNotBarrier(FromH,FromT),
	solve(Point, To, Tail).

% subgoal met if point at coordinates (H, W) is not a barrier
isNotBarrier(H,W) :-
	getLast(W, Width),
	\+(barrier(H, Width)).

% required for isNotBarrier/2
getLast([E], E) :- !.
getLast([_|Tail], E) :- getLast(Tail, E).