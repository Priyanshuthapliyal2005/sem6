%{
    #include"y.tab.h"
    #include<stdlib.h>
%}

%%

[0-9]+ {yylval=atoi(yytext); return NUMBER;}
"+" {return PLUS;}
"(" {return LP;}
")" {return RP;}
"-" {return SUB;}
"*" {return MULTIPLY;}
"/" {return divide;}
[ \t]+ {}
. {printf("Invalid Expression");}

%%

int yywrap(){
    return 1;
}