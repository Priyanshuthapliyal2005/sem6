%{
#include <stdio.h>
int flag = 0;
%}

%%
[ \t]+          ; /* Skip whitespace */
"true"|"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"  { printf("'%s' is a keyword\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("'%s' is not a keyword\n", yytext); }
.               ; /* Skip other characters */
\n              ; /* Skip newline */
%%

int main() {
    printf("Enter the string: \n");
    yylex();
    return 0;    
}

int yywrap() {
    return 1;
}

