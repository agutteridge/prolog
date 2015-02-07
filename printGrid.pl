:- [maze].

printGrid(L) :-
   printNums,
   printHorizontal,
   printRows(L),
   printHorizontal,
   !.

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
 
printRows(P) :-
	printRow(1, P),
	!.

printRow(H, _) :-
	mazeSize(Height, _),
	H is Height + 1.

printRow(H, P) :-
   write('  '), write(H), write(' |'),
   printElement(H, 1, P), write('|'), nl,
   H2 is H + 1,
   printRow(H2, P).

printElement(_, W, _) :-
	mazeSize(_, Width),
	W is Width + 1.	

printElement(H, W, P) :- 
	isMember([H|W], P), write('* '),
	W2 is W + 1,
	printElement(H, W2, P);
	barrier(H, W), write('x '),
	W2 is W + 1,
	printElement(H, W2, P);
	write('. '),
	W2 is W + 1,
	printElement(H, W2, P).

isMember(E, [E|_]) :- !.

isMember(E, [_|Tail]) :-
	isMember(E, Tail).

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