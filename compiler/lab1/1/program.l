%{
#include<stdio.h>
%}

%%

hello { printf("hello found! \n"); }
world { printf("world found! \n"); }
[0-9]+ {printf("Number found : %s\n",yytext); }
[a-z]+ { printf("Character  : %s\n" ,yytext); }
[A-Z]+ { printf("Character  : %s\n" ,yytext); }

%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}