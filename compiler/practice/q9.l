%{
    #include<stdio.h>
%}

%%

[a-zA-Z0-9_.]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,} { printf("Valid Email: %s\n", yytext); }
.    { printf("Invalid Email: %s\n", yytext); }
%%


int main(){
    printf("Enter the input:\n");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}