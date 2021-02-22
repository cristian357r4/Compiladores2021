package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]
D=[0-9]
DATA=[data]
SEGMENT=[segment]
BINARIO=[1|0]
espacio=[ ,\t,\r,\n]
%{
    public String lexeme;
%}
%%
ax |
ah |
al |
bx |
bh |
bl |
cx |
ch |
cl |
dx |
dh |
dl |
si |
di |
sp |
bd |
ss |
cs |
ds |
es |
while {lexeme=yytext(); return Registro;}
aaa |
movsw |
pushf |
idiv |
hlt |
sar |
xchg |
imul |
jc |
jn |
jo |
loope |
while {lexeme=yytext(); return Instruccion;}
db |
dw |
equ |
macro |
endm |
proc |
endp |
({DATA}{SEGMENT})|
while {lexeme=yytext(); return PseudoInstruccion;}
{espacio}+ {/*Ignore*/}
";".* {/*Ignore*/}

{L}({L}|{D})* {lexeme=yytext(); return Simbolo;}
(({BINARIO})*B) {lexeme=yytext(); return Binario;}
(("-"|"+"){D}+)|{D}+ {lexeme=yytext(); return Numero;}

 . {return ERROR;}
