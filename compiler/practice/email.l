%{
    #include<stdio.h>
%}

%%
[a-zA-Z0-9_.]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}  {printf("%s is the valid email",yytext);}
.*   {printf("%s is the not valid email",yytext);}
%%

int main(){
    printf("Enter the input:\n");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}