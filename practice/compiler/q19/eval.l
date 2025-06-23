%{
    #include<stdio.h>
    #include "eval.tab.h"
%}

%%
[0-9]+  {yylval=atoi(yytext);return NUM;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MUL;}
"/" {return DIV;}
"(" {return LP;}
")" {return RP;}
[\t ]+  {}
[\n]+  {return 0;}
.   {printf("invalid expression");}
%%

int yywrap(){
    return 1;
}