package analizadorLexico;
import static analizadorLexico.Token.*;
%%
%class Lexer
%type Token
%column
%line
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
public int column;
public int line;
%}
%%

({INICIO}|{FIN}|{CLASS}|{IF}|{ELSE}|{INT}|{STRING}|{PRINTF}) {lexeme=yytext(); column= yycolumn; line=yyline; return RESERVADA;}
("+"|"-"|"/"|"*") {lexeme=yytext(); column= yycolumn; line=yyline; return ARITMETICOS;}
"=" {lexeme=yytext(); column= yycolumn; line=yyline; return ASIGNACION;}
("<"|"<="|">"|">="|"=="|"!=") {lexeme=yytext(); column= yycolumn; line=yyline; return RELACIONALES;}
(";"|","|"("|")"|"["|"]"|"{"|"}"|"\"") {lexeme=yytext(); column= yycolumn; line=yyline; return SIMBOLO;}

{M}({L}|{N})* {lexeme=yytext(); column= yycolumn; line=yyline; return IDENTIFICADOR;}
"-"?{DecIntegerLiteral} {lexeme=yytext(); column= yycolumn; line=yyline; return NUMERO;}
{DecIntegerLiteral}({M}|{L}|{N})+ {lexeme=yytext(); column= yycolumn; line=yyline; return DESCONOCIDO;}
"=!" {lexeme=yytext(); column= yycolumn; line=yyline; return DESCONOCIDO;}
{ESPECIALES}+ {/* ignore */}
"//".* {/* ignore */}
[^] {lexeme=yytext(); column= yycolumn; line=yyline; return ERROR;}