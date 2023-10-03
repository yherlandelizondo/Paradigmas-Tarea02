:-consult('Logic/splitter.pl').
:-consult('expertSystem/parser.pl').
:-consult('Logic/lastElem.pl').


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
    nl,write('Okay. Ingresa un punto intermedio o escribe "ya" para terminar.'), nl,
    read_string(user_input, "\n", "\r", _, INTERMEDIATE),
    split_string(INTERMEDIATE, ' ', SUBLIST_INTER), 
        (INTERMEDIATE = "ya" -> answer(INTERMEDIATE_LIST) 
        ; 
            (analyzeSentence(SUBLIST_INTER) -> lastElement(SUBLIST_INTER, LASTITEM), append(INTERMEDIATE_LIST, [LASTITEM], NEW_INTERMEDIATE_LIST), 
            addIntermediate(NEW_INTERMEDIATE_LIST))
            ; 
            (analyzeAuxiliarSentence(SUBLIST_INTER) -> interDirectioner(INTERMEDIATE_LIST) 
                %aqui llamamos a los predicados correspondientes que preguntan cual y donde
                
            ; %si no se cumple, llama error
            intermediateError(INTERMEDIATE_LIST))).

interDirectioner(INTERMEDIATE_LIST) :-
    nl,write("Cual?"), nl,
    read_string(user_input, "\n", "\r", _, SITUATION), 
    nl, write("Indicame donde queda "),
    write(SITUATION), 
    write("?"), nl,
    read_string(user_input, "\n", "\r", _, SITUATION_INTERMEDIATE),
    split_string(SITUATION_INTERMEDIATE, ' ', SUBLIST_SITUATION), 
    (analyzeSentence(SUBLIST_SITUATION) -> lastElement(SUBLIST_SITUATION, LASTITEM), append(INTERMEDIATE_LIST, [LASTITEM], NEW_INTERMEDIATE_LIST),
    addIntermediate(NEW_INTERMEDIATE_LIST)
    ;
    intermediateError(INTERMEDIATE_LIST)).
    
answer(INTERMEDIATE_LIST) :-
    nl,write('Tu ruta a seguir es la siguiente'), nl,
    write(INTERMEDIATE_LIST),
    nl,write('Con un tiempo estimado de '), 
    write(" minutos"),
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
    



