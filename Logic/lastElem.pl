
% Rule to obtain the last element of the list.
% Input: List, Variable that represent the last item.
% Return: The last element of the input list. 

lastElement([LAST], LAST).
lastElement([_|Tail], LAST) :- lastElement(Tail, LAST).

