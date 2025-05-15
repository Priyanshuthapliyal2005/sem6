%{
    #include<stdio.h>
%}

%%

"auto"|"break"|"case"|"char"|"double"|"else"|"float"|"for"|"if"|"int"|"long"|"return"|"short"|"signed"|"sizeof"|"struct"|"switch"|"void"|"while" {printf("%s is a keyword\n",yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {printf("%s is an identifier\n",yytext);}
[0-9]+ {printf("%s is a number\n",yytext);}
[-+*/^=] {printf("%s is an operator\n", yytext);}
[,;] {printf("%s is separator\n", yytext);}

%%

int main(){
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}