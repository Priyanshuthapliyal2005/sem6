%{
    #include<stdio.h>
%}

%%
-?[0-9]+   {printf("integer");}
-?[0-9]*.[0-9]+   {printf("float");}
%%

int main(){
    printf("Enter the input:\n");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}