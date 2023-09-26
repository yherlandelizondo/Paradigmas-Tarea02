%------------------------BNF
% Grammar BNF in Prolog 

    % Grammatical rules

    origin --> originPlace.
    origin --> ['Estoy', 'en'], originPlace.
    origin --> ['Ubicado', 'en'], originPlace.

    originPlace --> ['Cartago'].
    originPlace --> ['Tres', 'Rios'].
    originPlace --> ['San', 'Pedro'].
    originPlace --> ['Taras'].


%------------------------PARSER

    origin(Input) :- phrase(origin, Input).

%------------------------SAMPLE
% ?- origin(['Estoy','en','Cartago']).