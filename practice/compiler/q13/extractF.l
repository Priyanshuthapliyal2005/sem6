%{
    #include<stdio.h>
%}

%%
("int"|"float"|"char"|"double"|"void")[ \t]+[A-Za-z_][A-Za-z0-9_]*[ \t]*\([^\)]*\)[ \t]*\{    {fprintf(yyout, "%s is a whole function\n", yytext);}
[a-zA-Z_][A-Za-z0-9_]*\([^\)]*\)[;]    {fprintf(yyout, "%s is a function name on call .\n", yytext);}
.|\n    {}
%%

int main()
{
    yyin = fopen("input.c","r");
    yyout= fopen("output.txt","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap()
{
    return 1;
}