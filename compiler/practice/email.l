%{
    #include <stdio.h>
%}

%%

# Match URLs starting with http/https
(http|https)://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}(/[a-zA-Z0-9._/?=&%-]*)?  { printf("Valid URL: %s\n", yytext); }

# Match URLs starting with www.
www\.[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}(/[a-zA-Z0-9._/?=&%-]*)?  { printf("Valid URL: %s\n", yytext); }

.   {}

%%

int main() {
    printf("Enter input:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
