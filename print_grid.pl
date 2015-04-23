:- [maze].

print_grid(Path) :-
   print_nums,
   print_horizontal,
   print_row(1, Path),
   print_horizontal,
   !.

% printing the top row of numbers above the maze
print_nums :-
	write('    '),
	print_nums(1).
print_nums(W) :-
	maze_size(_, Width),
	W is Width + 1,
	nl.
print_nums(N) :-
	write(' '),
	write(N),
	N2 is N + 1,
	print_nums(N2).

% writes horizontal boundaries of maze
print_horizontal :- 
	write('   +'),
	write('--'),
	print_horizontal(1).
print_horizontal(Width) :-
	maze_size(_, Width),
	write('-+'), nl.
print_horizontal(N) :-
	write('--'),
	N2 is N + 1,
	print_horizontal(N2).
 
% write each row of maze, calls print_element
print_row(H, _) :-
	maze_size(Height, _),
	H is Height + 1.
print_row(H, Path) :-
   write('  '), write(H), write(' |'),
   print_element(H, 1, Path), write('|'), nl,
   H2 is H + 1,
   print_row(H2, Path).

% prints character depending on if the coordinates represent
% a part of the path, a barrier, or neither
print_element(_, W, _) :-
	maze_size(_, Width),
	W is Width + 1.	
print_element(H, W, Path) :- 
	is_member([H, W], Path), write('* '),
	W2 is W + 1,
	print_element(H, W2, Path);
	barrier(H, W), write('x '),
	W2 is W + 1,
	print_element(H, W2, Path);
	write('. '),
	W2 is W + 1,
	print_element(H, W2, Path).

% recursive search for element E in a list
is_member(E, [E|_]) :- !.
is_member(E, [_|Tail]) :- is_member(E, Tail).