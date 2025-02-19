%{
#include <stdio.h>
#include <string.h>
%}

%%

^[a-zA-Z_][a-zA-Z0-9_]* { 
    printf("Valid identifier\n"); 
}

^[^a-zA-Z_][a-zA-Z0-9_]* { 
    printf("Error: invalid identifier!\n");
}

.|\n {}  // This rule consumes characters without doing anything, just to avoid infinite loops

%%

int main(){
    printf("Enter string you want to check: \n");
    yylex(); // This starts the lexing process
    return 0;
}

int yywrap(){
    return 1;
}
