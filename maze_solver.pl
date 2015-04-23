% start of program
solve(From, To, Path) :-
	get_tail(Path, Rest_of_path),
	solve_helper(From, To, Rest_of_path),
	nl,
	write('The solution: '), write(Path), nl, nl,
	print_grid(Path),
	!.

% removing the head of a list
get_tail([_|Tail], Tail).

% helper method so that Next =/= From
solve_helper(From, To, [To]) :- 
	valid(From, To).
solve_helper(From, To, [Next|Tail]) :-
	solve_helper(Next, To, Tail),
	valid(From, Next).

% batch of predicates to test pair of coordinates
valid(From, To) :-
	adjacent(From, To),
	within_range(From),
	within_range(To),
	not_barrier(From),
	not_barrier(To).

% are 2 coordinates adjacent?
adjacent([H1|T1], [H2|T2]) :-
	get_last(T1, N1),
	get_last(T2, N2),
	adjacent(H1, N1, H2, N2).
adjacent(H, T1, H, T2) :- 
	T1 is T2 + 1; 
	T1 is T2 - 1.
adjacent(H1, T, H2, T) :- 
	H1 is H2 + 1; 
	H1 is H2 - 1.

% are the coordinates within the boundaries of the maze?
within_range([H|W]) :- 
	get_last(W, Width),
	maze_size(_, MaxWidth),
	=<(Width, MaxWidth),
	>(Width, 0),
	maze_size(MaxHeight, _),
	=<(H, MaxHeight),
	>(H, 0).

% is there a barrier at this coordinate?
not_barrier([H|W]) :-
	get_last(W, Width),
	\+(barrier(H, Width)).

% fetching the last element of a list
get_last([T|[]], T) :- !.
get_last([_|Tail], T) :- get_last(Tail, T).
