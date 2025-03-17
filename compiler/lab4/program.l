%{
#include<stdio.h>
%}
%%
[0-9]*\.[0-9]+ {printf("float number.\n");}
[0-9]+ {printf("INTEGER number.\n");}
.+ {printf("wrong number.\n");}
%%
int main()
{
    printf("enter input");
    yylex();

}
int yywrap()
{
    return 1;
}
