%------------------------BNF FOR DESTINIES
% Grammar BNF in Prolog 

    % Grammatical rules

    destiny --> destinyPlace.
    destiny --> ["Mi", "destino", "es"], destinyPlace.
    destiny --> ["Voy", "a"], destinyPlace.
    destiny --> ["Voy", "para"], destinyPlace.
    destiny --> ["Me", "dirijo", "a"], destinyPlace.
    destiny --> ["Quiero", "ir", "a"], destinyPlace.
    destiny --> ["Quiero", "llegar", "a"], destinyPlace.
    destiny --> ["Estoy", "planeando", "ir", "a"], destinyPlace.
    destiny --> ["Tengo", "como", "destino"], destinyPlace.
    destiny --> ["El", "lugar", "al", "que", "me", "dirijo", "es"], destinyPlace.
    destiny --> ["Mi", "parada", "es"], destinyPlace.
    destiny --> ["Estoy", "viajando", "a"], destinyPlace.
    destiny --> ["Parare", "en"], destinyPlace.

    destinyPlace --> ["Cartago"].
    destinyPlace --> ["Heredia"].
    destinyPlace --> ["Puntarenas"].
    destinyPlace --> ["Alajuela"].
    destinyPlace --> ["San", "Jose"].

    destinyPlace --> ["Turrialba"].
    destinyPlace --> ["Taras"].
    destinyPlace --> ["Paraiso"].
    destinyPlace --> ["Perez", "Zeledon"].

%------------------------PARSER

    destiny(Input) :- phrase(destiny, Input).

%------------------------SAMPLE
% ?- destiny(["Estoy","en","Cartago"]).