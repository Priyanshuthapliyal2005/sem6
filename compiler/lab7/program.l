%{
    #include<stdio.h>
    extern FILE *yyin, *yyout;
%}

%%
"<"[^>]*">"    { fprintf(yyout, "%s\n", yytext); }
.|\n           ;
%%

int main() {
    yyin = fopen("input.html", "r");
    yyout = fopen("output.txt", "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap() {
    return 1;
}