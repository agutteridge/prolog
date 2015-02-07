:- consult(main).

:- begin_tests(main).

% does getLast work?
test(getLast) :- getLast([3,3], 3).

% does isAdjacent work in all directions? 
% [nondet] surpresses warnings for test succeeding with choicepoint
test(isAdjacent, [nondet]) :- isAdjacent([3,2], [2,2]).
test(isAdjacent, [nondet]) :- isAdjacent([3,2], [3,1]).
test(isAdjacent, [nondet]) :- isAdjacent([3,2], [4,2]).
test(isAdjacent, [nondet]) :- isAdjacent([3,2], [3,3]).
test(isAdjacent, [fail]) :- isAdjacent([3,3], [5,3]).
test(isAdjacent, [fail]) :- isAdjacent([3,3], [3,5]).

% does isNotBarrier work for both cases (true/false)?
test(isNotBarrier, [fail]) :- isNotBarrier([1,8]).
test(isNotBarrier) :- isNotBarrier([1,1]).

test(isWithinRange) :- isWithinRange([1,1]).
test(isWithinRange, [fail]) :- isWithinRange([0,1]).
test(isWithinRange, [fail]) :- isWithinRange([1,0]).
test(isWithinRange, [fail]) :- isWithinRange([1,10]).
test(isWithinRange, [fail]) :- isWithinRange([6,1]).

test(solve) :- solve([3,2], [2,6], [[3,2], [3,3], [2,3], [1,3], [1,4], [1,5], [1,6], [2,6]]).

:- end_tests(main).

:- run_tests.