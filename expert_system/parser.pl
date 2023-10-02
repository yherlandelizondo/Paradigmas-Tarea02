:-consult('BNF.pl').

%-------------------------------------PARSER

analyzeSentence(Input) :- phrase(sentence, Input).
