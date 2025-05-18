%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "math_eval.tab.h"
%}

%%

[0-9]+ {yylval.num=atoi(yytext); return NUMBER;}
"+" {return PLUS;}
"(" {return LP;}
")" {return RP;}
"-" {return SUB;}
"*" {return MULTIPLY;}
"/" {return divide;}
[ \t]+ {}
. {printf("Invalid Character: %s\n", yytext); return 0;}

%%

int yywrap(){
    return 1;
}