%{
    #include<stdio.h>
    #include "calc.tab.h"
%}

%%

[0-9]+ {yylval=atoi(yytext); return NUM;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MULTIPLY;}
"/" {return DIVIDE;}
"(" {return LPAREN;}
")" {return RPAREN;}
\n {return 0;}
[ \t] {}

%%

int yywrap(){
    return 1;
}