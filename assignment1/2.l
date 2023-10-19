%{
#include <stdio.h>
%}

%option noyywrap

%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"   {printf("Keyword: %s\n", yytext);}
[0-9]+      {printf("Number: %s\n", yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {printf("Identifier: %s\n", yytext);}
"=="|"!="|"<"|">"|"<="|">=" {printf("Operator: %s\n", yytext);}
"=" {printf("Assignment Operator: %s\n", yytext);}
"+"|"-"|"*"|"/"|"%" {printf("Arithmetic Operator: %s\n", yytext);}
"&"|"|"|"^"|"~" {printf("Bitwise Operator: %s\n", yytext);}
"&&"|"||"|"!" {printf("Logical Operator: %s\n", yytext);}
"<<"|">>" {printf("Shift Operator: %s\n", yytext);}
"++"|"--" {printf("Increment/Decrement Operator: %s\n", yytext);}
"&"|"*"|"->" {printf("Pointer Operator: %s\n", yytext);}
"sizeof" {printf("Sizeof Operator: %s\n", yytext);}
"[" {printf("Left Square Bracket: %s\n", yytext);}
"]" {printf("Right Square Bracket: %s\n", yytext);}
"(" {printf("Left Parenthesis: %s\n", yytext);}
")" {printf("Right Parenthesis: %s\n", yytext);}
"{" {printf("Left Curly Brace: %s\n", yytext);}
"}" {printf("Right Curly Brace: %s\n", yytext);}
"," {printf("Comma: %s\n", yytext);}
";" {printf("Semicolon: %s\n", yytext);}
[ \t\n]     ;  // skip whitespace and newlines
.           {printf("Unknown token: %s\n", yytext);}
%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}
