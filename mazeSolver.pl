solve(From, To, Path) :-
	% helper method so that Next =/= From
	getTail(Path, RestOfPath),
	solveHelper(From, To, RestOfPath),
	nl,
	write('The solution: '), write(Path), nl, nl,
	printGrid(Path),
	!.

getTail([_|Tail], Tail).

solveHelper(From, To, [To]) :- 
	valid(From, To).

solveHelper(From, To, [Next|Tail]) :-
	solveHelper(Next, To, Tail),
	valid(From, Next).

% batch of predicates to test pair of coordinates
valid(From, To) :-
	isAdjacent(From, To),
	isWithinRange(From),
	isWithinRange(To),
	isNotBarrier(From),
	isNotBarrier(To).

% is there a barrier at this coordinate?
isNotBarrier([H|W]) :-
	getLast(W, Width),
	\+(barrier(H, Width)).

% are 2 coordinates adjacent?
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

% are the coordinates within the boundaries of the maze?
isWithinRange([H|W]) :- 
	getLast(W, Width),
	mazeSize(_, MaxWidth),
	=<(Width, MaxWidth),
	>(Width, 0),
	mazeSize(MaxHeight, _),
	=<(H, MaxHeight),
	>(H, 0).

% fetching tail of a list
getLast([T|[]], T) :- !.
getLast([_|Tail], T) :- getLast(Tail, T).
