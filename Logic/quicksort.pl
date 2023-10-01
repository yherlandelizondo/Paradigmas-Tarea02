quicksort([], []).
quicksort([X|Xs], Sorted) :-
    partition(Xs, X, Lows, Highs),
    quicksort(Lows, SortedLows),
    quicksort(Highs, SortedHighs),
    append(SortedLows, [X|SortedHighs], Sorted).

partition([], _, [], []).
partition([[Name1, Dist1]|Ys], [Name2, Dist2], [[Name1, Dist1]|Lows], Highs) :-
    Dist1 =< Dist2,
    partition(Ys, [Name2, Dist2], Lows, Highs).
partition([[Name1, Dist1]|Ys], [Name2, Dist2], Lows, [[Name1, Dist1]|Highs]) :-
    Dist1 > Dist2,
    partition(Ys, [Name2, Dist2], Lows, Highs).

% Rule to get the first elemento of a list
first_element([FIRST_ELEMENT|_], FIRST_ELEMENT).

% Rule to get the last element of a list
last_element([LAST], LAST).
last_element([_|REST], LAST) :-
last_element(REST, LAST).


