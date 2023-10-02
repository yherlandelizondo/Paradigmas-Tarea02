:-consult('Logic/splitter.pl').
:-consult('expert_system/parser.pl').


%-------------------------------------WELCOME
heywazelog :-
    nl, write('Hola usuario, bienvenido.'), 
    nl, write("NOTA: Recuerde usar MAYUSCULAS donde es debido y evitar tanto tildes como puntos finales."), 
    nl, getOrigin.
 
%-------------------------------------WAZELOG EXPERT SYSTEM
getOrigin:-
    nl,write('Donde se encuentra ubicado actualmente?.'), nl,
    read_string(user_input, "\n",  "\r", _, START),
    split_string(START, ' ', SUBLIST_START), 
    (analyzeSentence(SUBLIST_START) -> getDestination ; originError).
    
getDestination:-
    nl,write('Favor ingresa tu destino.'), nl,
    read_string(user_input, "\n", "\r", _, END),
    split_string(END, ' ', SUBLIST_END), 
    (analyzeSentence(SUBLIST_END) -> addIntermediate([]) ; destinyError).


addIntermediate(INTERMEDIATE_LIST):-
    nl,write('Ingresa el punto intermedio o escribe no para terminar.'), nl,
    read_string(user_input, "\n", "\r", _, INTERMEDIATE),
    split_string(INTERMEDIATE, ' ', SUBLIST_INTER), 
        (INTERMEDIATE = "no" -> answer(INTERMEDIATE_LIST) 
        ; 
            (analyzeSentence(SUBLIST_START) -> append(INTERMEDIATE_LIST, [INTERMEDIATE], NEW_INTERMEDIATE_LIST), 
            addIntermediate(NEW_INTERMEDIATE_LIST)
            ; 
            intermediateError(INTERMEDIATE_LIST))).

answer(INTERMEDIATE_LIST) :-
    nl,write('Tu ruta a seguir es la siguiente'), nl,
    write(INTERMEDIATE_LIST),
    nl,write('Con un tiempo estimado de '), nl,
    (endConversation).
    
endConversation:-
    nl,write('Deseas terminar la conversacion? (si/no)'), nl,
    read_string(user_input, "\n", "\r", _, TERMINATE),
    nl,(TERMINATE = "si" -> write('Gracias por usar el programa. Conversacion terminada.'), nl, nl ; addIntermediate([])). 

%-------------------------------------ERROR MANAGER
originError:-
    nl, write("El origen ingresado no se encuentra en mi base de datos o no comprendo tu entrada, favor ingresa una distinta."),nl,
    getOrigin.

destinyError:-
    nl, write("El destino ingresado no se encuentra en mi base de datos o no comprendo tu entrada, favor ingresa una distinta."),nl,
    getDestination.

intermediateError(INTERMEDIATE_LIST):-
    nl, write("El destino ingresado no se encuentra en mi base de datos o no comprendo tu entrada, favor ingresa una distinta."),nl, 
    addIntermediate(INTERMEDIATE_LIST).
    



