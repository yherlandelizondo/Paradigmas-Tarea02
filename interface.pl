consult('./splitter.pl').
consult('./parser.pl').

:- use_module('./splitter.pl', [separar_cadena/3]).




%------------------------WELCOME
heywazelog :-
    write('Hola usuario, donde se encuentra ubicado actualmente?.'), nl,
    read_string(user_input, "\n",  "\r", _, Start),
    write('Usted esta en '), write(Start), nl,

    write('Favor ingrese su destino.'), nl,
    read_string(user_input, "\n", "\r", _, End),
    write('Usted va para '), write(End), nl, 
    continueconversation.

continueconversation :-
    write('Desea agregar un punto intermedio?'), nl,
    read_string(user_input, "\n", "\r", _, Answer),
    (Answer = "si" -> addintermediate ; endconversation).

addintermediate :-
    write('Ingrese el punto intermedio o escriba no para terminar.'), nl,
    read_string(user_input, "\n", "\r", _, Intermediate),
    (Intermediate = "no" -> endconversation ; continueconversation).

endconversation :-
    write('Desea terminar la conversacion? (si/no)'), nl,
    read_string(user_input, "\n", "\r", _, Terminate),
    (Terminate = "si" -> write('Gracias por usar el programa. Conversacion terminada.'), nl ; continueconversation).



