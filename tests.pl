testRun :- nl, print('starting testing'), nl fail.
testRun :- test(Result), fail.
testRun :- nl, print('end of testing'), nl. 

test(Result) :- test(getLast([3,3], 3)).