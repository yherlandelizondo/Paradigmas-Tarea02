:-consult('Logic/splitter.pl').
:-consult('Parsers/originParser.pl').
:-consult('Parsers/destinyParser.pl').
:-consult('Parsers/intermediateParser.pl').

%------------------------WELCOME
heywazelog :-
    nl, write('Hola usuario, bienvenido.'), 
    nl, write("NOTA: Recuerde usar MAYUSCULAS donde es debido y evitar tanto tildes como puntos finales."), 
    nl, getOrigin.
 
%------------------------DATA COLLECTION
getOrigin:-
    nl,write('Donde se encuentra ubicado actualmente?.'), nl,
    read_string(user_input, "\n",  "\r", _, START),
    split_string(START, ' ', SUBLIST_START), 
    (origin(SUBLIST_START) -> getDestination ; originError).
    
getDestination:-
    nl,write('Favor ingresa tu destino.'), nl,
    read_string(user_input, "\n", "\r", _, END),
    split_string(END, ' ', SUBLIST_END), 
    (destiny(SUBLIST_END) -> continueConversation ; destinyError).

continueConversation :-
    nl,write('Deseas agregar un punto intermedio?'), nl, 
    read_string(user_input, "\n", "\r", _, ANSWER),
    (ANSWER = "si" -> addIntermediate([]) ; endConversation).

addIntermediate(INTERMEDIATE_LIST):-
    nl,write('Ingresa el punto intermedio o escribe no para terminar.'), nl,
    read_string(user_input, "\n", "\r", _, INTERMEDIATE),
    split_string(INTERMEDIATE, ' ', SUBLIST_INTER), 
        (INTERMEDIATE = "no" -> endConversation(INTERMEDIATE_LIST)
        ; 
            (inter(SUBLIST_INTER) -> append(INTERMEDIATE_LIST, [INTERMEDIATE], NEW_INTERMEDIATE_LIST), 
            addIntermediate(NEW_INTERMEDIATE_LIST)
            ; 
            intermediateError(INTERMEDIATE_LIST))).
    
endConversation(INTERMEDIATE_LIST) :-
    nl,write('Deseas terminar la conversacion? (si/no)'), nl,
    read_string(user_input, "\n", "\r", _, TERMINATE),
     write(INTERMEDIATE_LIST),
    nl,(TERMINATE = "si" -> write('Gracias por usar el programa. Conversacion terminada.'), nl, nl ; continueConversation).

%------------------------errorManager
originError:-
    nl, write("El origen ingresado no se encuentra en mi base de datos o no comprendo tu entrada, favor ingresa una distinta."),nl,
    getOrigin.

destinyError:-
    nl, write("El destino ingresado no se encuentra en mi base de datos o no comprendo tu entrada, favor ingresa una distinta."),nl,
    getDestination.

intermediateError(INTERMEDIATE_LIST):-
    nl, write("El destino ingresado no se encuentra en mi base de datos o no comprendo tu entrada, favor ingresa una distinta."),nl, 
    addIntermediate(INTERMEDIATE_LIST).
    



