%{
    #include<stdio.h>
%}

%%
-?[0-9]+ {printf("Valid integer");}
-?[0-9]*\.[0-9]+  {printf("Float number");}
.+  {printf("wrong input");}
%%

int main(){
    printf("Enter input");
    yylex();
}

int yywrap(){
    return 1;
}