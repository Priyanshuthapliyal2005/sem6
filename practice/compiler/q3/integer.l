%{
    #include<stdio.h>
%}


%%

-?[0-9]* {printf("%s is a valid integer\n",yytext);}
-?[0-9]*"."[0-9]+ {printf("%s is a valid float\n",yytext);}

. {printf("%s is not a valid integer or float\n",yytext);}

%%

int main(){
    printf("Enter the input:\n");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}

