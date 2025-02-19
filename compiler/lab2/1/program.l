%{
    #include <stdio.h>
    int linecount = 0, spacecount = 0, tabcount = 0, restcount = 0;
%}

%%

\n             { linecount++; }
[ ]            { spacecount++; }
[\t]           { tabcount++; }
[^ \t\n]       { restcount++; }

%%

int main() {
    printf("Enter the sentence: \n");
    yylex();
    printf("Line count: %d\n", linecount);
    printf("Space count: %d\n", spacecount);
    printf("Tab count: %d\n", tabcount);
    printf("Rest count: %d\n", restcount);
    return 0;
}

int yywrap() {
    return 1;
}
