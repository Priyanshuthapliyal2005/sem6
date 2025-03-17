%{
#include <stdio.h>
%}

%%
[0-9]*[02468]  { printf("Even number\n"); }
[0-9]*[13579]  { printf("Odd number\n"); }
.|\n    { }
%%

int main() {
    printf("Enter a number: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
} 