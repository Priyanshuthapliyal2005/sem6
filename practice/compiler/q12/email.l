%{
    #include<stdio.h>
%}

%%
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}   {printf("%s is valid\n", yytext);}
.+   {printf("%s is invalid\n", yytext);}
%%

int main(){
    printf("Enter an email: ");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}