%{
    #include<stdio.h>
%}
%%

^[a-zA-Z_][a-zA-Z0-9_]* {printf("valid identifier\n");}
^[^a-zA-Z_][a-zA-Z0-9_]* {printf("invalid identifier\n");}
.|\n {}
%%
int main(){
    printf("Enter something: ");
    yylex();
    return 0;
}

int yywrap(){
    return 1;   
}
