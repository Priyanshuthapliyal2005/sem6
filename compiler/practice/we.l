%{
    #include<stdio.h>
%}

%%

"https://"[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}   { printf("Valid URL\n"); }
"http://"[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}   { printf("Valid URL\n"); }
.|\n                                  { printf("Invalid URL\n"); }  /* Handles invalid input */

%%

int main() {
    printf("Enter the input:\n");
    yyin = stdin;  // Read from standard input
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
