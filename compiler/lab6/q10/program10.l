%{
#include <stdio.h>
FILE *yyin, *yyout;
%}

%%
"/*"[^*]*"*"+([^*/][^*]*"*"+)*"/"    { /* Skip block comments */ }
"//".*                                { /* Skip single-line comments */ }
.                                     { fprintf(yyout, "%s", yytext); }
\n                                    { fprintf(yyout, "\n"); }
%%

int main() {
    yyin = fopen("input.c", "r");
    yyout = fopen("out.c", "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap() {
    return 1;
} 