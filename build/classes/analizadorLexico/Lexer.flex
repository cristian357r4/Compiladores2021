package analizadorLexico;
import static analizadorLexico.Token.*;
%%
%class Lexer
%type Token
M=[a-z_]
L=[a-zA-Z_]

N=[0-9]
DecIntegerLiteral = 0 | [1-9][0-9]*

INICIO=Inicio
FIN=Fin
CLASS=class
IF=if
ELSE=else
INT=int
STRING=string
PRINTF=printf

LineTerminator = \r|\n|\r\n
ESPECIALES = {LineTerminator} | [ \t\f]

%{
public String lexeme;
%}
%%

({INICIO}|{FIN}|{CLASS}|{IF}|{ELSE}|{INT}|{STRING}|{PRINTF}) {lexeme=yytext(); return RESERVADA;}
("+"|"-"|"/"|"*") {lexeme=yytext(); return ARITMETICOS;}
"=" {lexeme=yytext(); return ASIGNACION;}
("<"|"<="|">"|">="|"=="|"!=") {lexeme=yytext(); return RELACIONALES;}
(";"|","|"("|")"|"["|"]"|"{"|"}"|"\"") {lexeme=yytext(); return SIMBOLO;}

{M}({L}|{N})* {lexeme=yytext(); return IDENTIFICADOR;}
"-"?{DecIntegerLiteral} {lexeme=yytext(); return NUMERO;}
{DecIntegerLiteral}({M}|{L}|{N})+ {lexeme=yytext(); return DESCONOCIDO;}
"=!" {lexeme=yytext(); return DESCONOCIDO;}
{ESPECIALES}+ {/* ignore */}
"//".* {/* ignore */}
[^]+ {lexeme=yytext(); return ERROR;}