%{
#include <stdio.h>
#include <string.h>

%}

%%

^[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Valid identifier\n");
}

^[^a-zA-Z_] {printf("Error: invalid identifier!\n"); }

%%

int main(){
    printf("Enter string you want to check : \n");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}