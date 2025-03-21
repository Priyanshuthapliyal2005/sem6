%{
    #include<stdio.h>
%}

%%

^.*   { fprintf(yyout, "#%s", yytext); }      

%%

int main(){
    yyin = fopen("lower.txt", "r");
    yyout = fopen("hashed.txt", "w");

    yylex();

    fclose(yyin);
    fclose(yyout);

    return 0;
}

int yywrap(){
    return 1;
}
