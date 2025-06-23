%{
    #include<stdio.h>
    #include "a.tab.h"
%}

%%
[0-9]+ {yylval=atoi(yytext);return NUM;}
[+] {return PLUS;}
[-] {return MINUS;}
[*] {return MUL;}
[/] {return DIV;}
[(] {return LP;}
[)] {return RP;}
[\n]    {return 0;}
[\t ]   {}
.   {printf("Invalid Expression");}
%%

int yywrap(){
    return 1;
}