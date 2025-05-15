%{
    #include<stdio.h>
%}

%%

[0-9]+ {printf("integer");}
[0-9]*.[0-9]+ {printf("Float");}

%%

int main(){
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}