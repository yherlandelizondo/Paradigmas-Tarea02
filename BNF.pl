%------------------------BNF
% Grammar BNF in Prolog 
    % Grammatical rules
    
    %   DETERM + LOCATION
    nounPhrase --> determ, place.
    %nounPhrase --> ["En"], Cartago.

    %   VERB + nounPhrase
    verbPhrase --> verb, nounPhrase.
    %verbPhrase --> ["Soy", "de"], place.
    
    %   Location
    sentence --> place.
    sentence --> nounPhrase.
    sentence --> verbPhrase.
    sentence --> determ, verbPhrase.
    sentence --> verb, verbPhrase.

    verb --> ["Estoy"].
    verb --> ["Soy"].
    verb --> ["Voy"].
    verb --> ["Parare"].
    verb --> ["Dirijo"].
    
    verb --> ["dirijo"].

    determ -->["en"].
    determ -->["En"].
    determ -->["de"].
    determ -->["De"].
    determ -->["a"].
    determ -->["A"].
    determ -->["para"].
    determ -->["Para"].
    
    determ -->["Me"].

    place --> ["Cartago"].
    place --> ["Heredia"].
    place --> ["Puntarenas"].
    place --> ["Alajuela"].
    place --> ["San", "Jose"].
    place --> ["Turrialba"].
    place --> ["Taras"].
    place --> ["Paraiso"].
    place --> ["Perez", "Zeledon"].

%------------------------PARSER

    analyzeSentence(Input) :- phrase(sentence, Input).

