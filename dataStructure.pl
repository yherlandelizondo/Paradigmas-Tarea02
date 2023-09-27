% Predicate to add an element to a list
addElement(ELEMENT, ORIGINAL_LIST, NEW_LIST) :-
    NEW_LIST = [ELEMENT | ORIGINAL_LIST].

example:-
    addElement(5, [1, 2, 3, 4], NEW_LIST),
    write(NEW_LIST).
%:-example.
