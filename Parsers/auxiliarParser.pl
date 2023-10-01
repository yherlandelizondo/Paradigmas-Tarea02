%------------------------BNF FOR DESTINIES
% Grammar BNF in Prolog 

    % Grammatical rules

    auxiliar --> answer.

    answer --> ["si"].
    answer --> ["Si"].
    answer --> ["no"].
    answer --> ["No"].
    answer --> ["Si", "quiero", "continuar"].
    answer --> ["No", "quiero", "continuar"].
    answer --> ["Si", "quiero", "agregar", "un", "punto", "intermedio"].
    answer --> ["No", "quiero", "agregar", "un", "punto", "intermedio"].


%------------------------PARSER

    auxiliar(Input) :- phrase(auxiliar, Input).