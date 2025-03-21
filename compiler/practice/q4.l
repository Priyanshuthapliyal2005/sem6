%{
    #include<stdio.h>
%}

%%
"int"|"float"|"const"|"double"|"for"|"auto"|"if"|"else"|"else if" {printf("%s is a keyword",yytext);}
[,;]    {printf("%s is a seperator",yytext);}
[a-zA-Z_][a-zA-Z0-9_]*  {printf("%s is a identifier",yytext);}
[-=+*/]    {printf("%s is a operator",yytext);}
-?[0-9]+ {printf("%s is a constant",yytext);}
.   {}
%%

int main(){
    printf("Enter the input:\n");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}