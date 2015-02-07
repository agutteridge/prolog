:- [maze].


printGrid :-
   printNums,
   printHorizontal,
   %% printMain,
   printHorizontal.

printGrid(L) :- nl,
   printNums,
   printHorizontal,
   %% printMain(L),
   printHorizontal.

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
 
%% printRow(L,L3) :-
%%    write('+ '),
%%    printTriplet(L,L1), write(' | '),
%%    printTriplet(L1,L2), write(' | '),
%%    printTriplet(L2,L3),
%%    write(' +').

%% printElement([X|L],L) :- var(X), !, write('.').
%% printElement([X|L],L) :- write(X).

printNums :-
	write('    '),
	printNums(1).

printNums(Width) :-
	mazeSize(_, Width),
	write(' '),
	write(Width), nl.

printNums(N) :-
	write(' '),
	write(N),
	N2 is N + 1,
	printNums(N2).