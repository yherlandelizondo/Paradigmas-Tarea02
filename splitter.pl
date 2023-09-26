% Cargar la biblioteca necesaria
:- use_module(library(strings)).

% Definir una cadena
cadena("Hola mundo de Gumball").

% Separar la cadena utilizando el número 4 como separador
separar_cadena(Cadena, Separador, ListaDeSubcadenas) :-
    split_string(Cadena, Separador, "", Subcadenas), % Obtén las subcadenas sin comillas

    % Envuelve cada subcadena en comillas y agrégala a la nueva lista
    maplist(wrap_in_quotes, Subcadenas, ListaDeSubcadenas).

% Predicado auxiliar para envolver una subcadena en comillas
wrap_in_quotes(Subcadena, SubcadenaConComillas) :-
    string_concat('"', Subcadena, Temp), % Agrega comillas al principio
    string_concat(Temp, '"', SubcadenaConComillas). % Agrega comillas al final


