%{
#include"a.tab.h"
#include<stdlib.h>
%}
%%
[0-9]+ {yylval=atoi(yytext); return NUMBER;}
[+\-*/] {return yytext[0];}
\n {return '\n' ;}
. {}
%%
int yywrap() {return 1;}