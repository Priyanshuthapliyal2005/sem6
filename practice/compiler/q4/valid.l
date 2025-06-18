%{
#include<stdio.h>
%}

%%
"const"|"auto"|"for"|"do"|"if"|"else"|"int"|"float"|"char"|"double" {printf("%s is a keyword\n",yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {printf("%s is a valid identifier\n",yytext);}
[0-9]+ {printf("%s is valid constant\n",yytext);}
[-+*/=] {printf("%s is a valid operator\n",yytext);}
[.,;(){}] {printf("%s is a valid separator\n",yytext);}
[ \t\n] ;  // Ignore whitespace
. {printf("%s is not a valid input\n",yytext);}
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}