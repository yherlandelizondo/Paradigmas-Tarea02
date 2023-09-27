%------------------------BNF
% Grammar BNF in Prolog 

    % Grammatical rules

    origin --> originPlace.
    origin --> ["Estoy", "en"], originPlace.
    origin --> ["Estoy", "ubicado", "en"], originPlace.
    origin --> ["Mi", "ubicacion", "actual", "es"], originPlace.
    origin --> ["Me", "encuentro", "en"], originPlace.
    origin --> ["Actualmente,", "estoy", "en"], originPlace.
    origin --> ["Actualmente", "estoy", "en"], originPlace.
    origin --> ["Donde", "estoy", "es"], originPlace.
    origin --> ["Mi", "posicion", "actual", "es"], originPlace.
    origin --> ["Actualmente,", "me", "encuentro", "en"], originPlace.
    origin --> ["Soy", "de"], originPlace.
    origin --> ["Me", "localizo", "en"], originPlace.
    origin --> ["Vivo", "en"], originPlace.


    originPlace --> ["Cartago"].
    originPlace --> ["Heredia"].
    originPlace --> ["Puntarenas"].
    originPlace --> ["Alajuela"].
    originPlace --> ["San", "Jose"].

    originPlace --> ["Turrialba"].
    originPlace --> ["Taras"].
    originPlace --> ["Paraiso"].
    originPlace --> ["Perez", "Zeledon"].


%------------------------PARSER

    origin(Input) :- phrase(origin, Input).

%------------------------SAMPLE
% ?- origin(["Estoy","en","Cartago"]).
