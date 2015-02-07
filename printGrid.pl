:- [maze].

printGrid(Path) :-
   printNums,
   printHorizontal,
   printRow(1, Path),
   printHorizontal,
   !.

% printing the top row of numbers above the maze
printNums :-
	write('    '),
	printNums(1).
printNums(W) :-
	mazeSize(_, Width),
	W is Width + 1,
	nl.
printNums(N) :-
	write(' '),
	write(N),
	N2 is N + 1,
	printNums(N2).

% writes horizontal boundaries of maze
printHorizontal :- 
	write('   +'),
	write('--'),
	printHorizontal(1).
printHorizontal(Width) :-
	mazeSize(_, Width),
	write('-+'), nl.
printHorizontal(N) :-
	write('--'),
	N2 is N + 1,
	printHorizontal(N2).
 
% write each row of maze, calls printElement
printRow(H, _) :-
	mazeSize(Height, _),
	H is Height + 1.
printRow(H, Path) :-
   write('  '), write(H), write(' |'),
   printElement(H, 1, Path), write('|'), nl,
   H2 is H + 1,
   printRow(H2, Path).

% prints character depending on if the coordinates represent
% a part of the path, a barrier, or neither
printElement(_, W, _) :-
	mazeSize(_, Width),
	W is Width + 1.	
printElement(H, W, Path) :- 
	isMember([H, W], Path), write('* '),
	W2 is W + 1,
	printElement(H, W2, Path);
	barrier(H, W), write('x '),
	W2 is W + 1,
	printElement(H, W2, Path);
	write('. '),
	W2 is W + 1,
	printElement(H, W2, Path).

% recursive search for element E in a list
isMember(E, [E|_]) :- !.
isMember(E, [_|Tail]) :- isMember(E, Tail).