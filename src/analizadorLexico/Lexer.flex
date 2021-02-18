package analizadorLexico;
import static analizadorLexico.Token.*;
%%
%class Lexer
%type Token
M=[a-z_$]
L=[a-zA-Z_$]
N=[0-9]
O=[+ - * / =]
T=[; | , | ( | ) | [ | ] | { | }]

R=[< | >| =| !]
A=[+]
B=[-]
C=[< >]
D=[=]
E=[!]
F=[&]
G=[|]
H=[* /]
i=[i]
f=[f]
e=[e]
l=[l]
s=[s]
n=[n]
t=[t]
r=[r]
u=[u]
v=[v]
o=[o]
d=[d]
w=[w]
h=[h]
z=[.]
ESPECIALES=[ \t\r\n]
%{
public String lexeme;
%}
%%
{ESPECIALES} {/* ignore */}
"//".* {/* ignore */}
{i}{f} {lexeme=yytext(); return RESERVADA;}
{e}{l}{s}{e} {lexeme=yytext(); return RESERVADA;}
{i}{n}{t} {lexeme=yytext(); return RESERVADA;}
{r}{e}{t}{u}{r}{n} {lexeme=yytext(); return RESERVADA;}
{v}{o}{i}{d} {lexeme=yytext(); return RESERVADA;}
{w}{h}{i}{l}{e} {lexeme=yytext(); return RESERVADA;}

{T} {lexeme=yytext(); return OTRO;}
{RES}{M}({L}|{N})* {lexeme=yytext(); return ID;}
({A}|{B})?{N}+ {lexeme=yytext();return INT;}

(({A}|{B})? {N}*{z}{N}*) {lexeme=yytext(); return DECIMAL;}
{O} {lexeme=yytext(); return OPERADOR;}
({B}{B}) {lexeme=yytext(); return OPERADOR;}
({A}{A}) {lexeme=yytext(); return OPERADOR;}
{C} {lexeme=yytext(); return OPERADOR;}
({C}{D}) {lexeme=yytext(); return OPERADOR;}
({E}{D}) {lexeme=yytext(); return OPERADOR;}
({D}{D}) {lexeme=yytext(); return OPERADOR;}
({F}{F}) {lexeme=yytext(); return OPERADOR;}
({G}{G}) {lexeme=yytext(); return OPERADOR;}
({E}{E}) {lexeme=yytext(); return OPERADOR;}
({A}{D}) {lexeme=yytext(); return OPERADOR;}
({B}{D}) {lexeme=yytext(); return OPERADOR;}
({H}{D}) {lexeme=yytext(); return OPERADOR;}
. {return ERROR;}