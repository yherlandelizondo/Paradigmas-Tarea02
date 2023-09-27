%------------------------BNF FOR INTERMEDIATE
% Grammar BNF in Prolog 

    % Grammatical rules

    inter --> interPlace.
    inter --> ["El", "punto", "intermedio", "es"], interPlace.
    inter --> ["El", "punto", "intermedio", "será"], interPlace.
    inter --> ["El", "punto", "intermedio", "estará", "en"], interPlace.
    inter --> ["Me", "gustaria", "parar", "en"], interPlace.
    inter --> ["Me", "gustaria", "hacer", "una", "parada", "en"], interPlace.
    inter --> ["Parare", "en"], interPlace.
    inter --> ["Hare", "una", "parada", "en"], interPlace.


    interPlace --> ["Cartago"].
    interPlace --> ["Heredia"].
    interPlace --> ["Puntarenas"].
    interPlace --> ["Alajuela"].
    interPlace --> ["San", "Jose"].

    interPlace --> ["Turrialba"].
    interPlace --> ["Taras"].
    interPlace --> ["Paraiso"].
    interPlace --> ["Perez", "Zeledon"].


%------------------------PARSER

    inter(Input) :- phrase(inter, Input).

%------------------------SAMPLE
% ?- inter(["Estoy","en","Cartago"]).