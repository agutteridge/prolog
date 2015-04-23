:- consult(main).

:- begin_tests(main).

% does get_last work?
test(get_last) :- get_last([3,3], 3).

% does adjacent work in all directions? 
% [nondet] surpresses warnings for test succeeding with choicepoint
test(adjacent, [nondet]) :- adjacent([3,2], [2,2]).
test(adjacent, [nondet]) :- adjacent([3,2], [3,1]).
test(adjacent, [nondet]) :- adjacent([3,2], [4,2]).
test(adjacent, [nondet]) :- adjacent([3,2], [3,3]).
test(adjacent, [fail]) :- adjacent([3,3], [5,3]).
test(adjacent, [fail]) :- adjacent([3,3], [3,5]).

% does not_barrier work for both cases (true/false)?
test(not_barrier, [fail]) :- not_barrier([1,8]).
test(not_barrier) :- not_barrier([1,1]).

test(within_range) :- within_range([1,1]).
test(within_range, [fail]) :- within_range([0,1]).
test(within_range, [fail]) :- within_range([1,0]).
test(within_range, [fail]) :- within_range([1,10]).
test(within_range, [fail]) :- within_range([6,1]).

test(solve) :- solve([3,2], [2,6], [[3,2], [3,3], [2,3], [1,3], [1,4], [1,5], [1,6], [2,6]]).

:- end_tests(main).

:- run_tests.