%{
 #include<stdio.h>   
%}

%%
[0-9]*[0 2 4 6 8]   {printf("%s is even number\n",yytext);}
[0-9]*[1 3 5 7 9]   {printf("%s is odd number\n",yytext);}
%%

int main(){
    printf("Enter a number\n: ");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}