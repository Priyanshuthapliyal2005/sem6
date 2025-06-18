%{
#include<stdio.h>
//valid identifier in c 
%}

%%
"const"|"auto"|"for"|"do" {printf("%s is a reserved keyword\n",yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {printf("%s is a valid identifier\n",yytext);}
.* {printf("%s is not a valid identifier\n",yytext);}
[\t\n ]+ {}
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
