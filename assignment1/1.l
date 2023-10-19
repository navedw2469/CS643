%{
#include <stdio.h>
%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT})*
KEYWORD     auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
STRING      \"([^\n\"]|\\\")*\"
WS          [ \t\n]+
COMMENT     "\\/\\/"[^\n]*|\\"\\/\\*.*\\*\\/"

%%
{STRING}    { printf("Found a string: %s\n", yytext); }
{DIGIT}+    { printf("Found a number: %s\n", yytext); }
{KEYWORD}   { printf("Found keyword: %s\n", yytext); }
{ID}        { printf("Found an identifier: %s\n", yytext); }
"=="        { printf("Found operator '=='\n"); }
"!="        { printf("Found operator '!='\n"); }
"<="        { printf("Found operator '<='\n"); }
">="        { printf("Found operator '>='\n"); }
"&&"        { printf("Found operator '&&'\n"); }
"||"        { printf("Found operator '||'\n"); }
"++"        { printf("Found operator '++'\n"); }
"--"        { printf("Found operator '--'\n"); }
"<"         { printf("Found operator '<'\n"); }
">"         { printf("Found operator '>'\n"); }
"&"         { printf("Found operator '&'\n"); }
"|"         { printf("Found operator '|'\n"); }
"^"         { printf("Found operator '^'\n"); }
"~"         { printf("Found operator '~'\n"); }
"!"         { printf("Found operator '!'\n"); }
"+"         { printf("Found operator '+'\n"); }
"-"         { printf("Found operator '-'\n"); }
"*"         { printf("Found operator '*'\n"); }
"/"         { printf("Found operator '/'\n"); }
"%"         { printf("Found operator '%%'\n"); }  /* Modulo Operator */
"="         { printf("Found operator '='\n"); }
"+="        { printf("Found operator '+='\n"); }
"-="        { printf("Found operator '-='\n"); }
"*="        { printf("Found operator '*='\n"); }
"/="        { printf("Found operator '/='\n"); }
"%="        { printf("Found operator '%%='\n"); }
"("         { printf("Found symbol '('\n"); }
")"         { printf("Found symbol ')'\n"); }
"{"         { printf("Found symbol '{'\n"); }
"}"         { printf("Found symbol '}'\n"); }
";"         { printf("Found symbol ';'\n"); }
","         { printf("Found symbol ','\n"); }
{COMMENT}   { /* Ignore comments */ }
{WS}        { /* Ignore whitespace */ }
.           { printf("Unexpected character: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}
