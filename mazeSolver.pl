% solve(List1, List2, List3[Lots of Lists])

solve(From, To, To) :- !.

solve(Head, To, [Head|[]]) :- 
	solve(From, To, Head).

solve(Head, To, [Head|Tail]) :- 
	solve(From, To, Tail).