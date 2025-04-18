## Study about Lex and Yacc Tools

### Lex Tool
Lex is a tool used to generate lexical analyzers. It reads a specification file containing regular expressions and generates C code for a lexical analyzer.

#### Example Lex Program
```lex
%{
#include <stdio.h>
%}

%%
[0-9]+  printf("Number: %s\n", yytext);
[a-zA-Z]+ printf("Word: %s\n", yytext);
.|\n    /* ignore other characters */
%%

int main() {
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}
```

`yylex()` is the main function generated by Lex. It reads the input, matches it against the defined regular expressions, and executes the corresponding actions. 

`yywrap()` is a function that Lex calls when the end of the input file is reached, and it should return 1 to indicate that there are no more files to process.

### How to Run
1. Save the Lex program to a file, e.g., `example.l`.
3. Run the following commands to generate and compile the code:
    ```sh
    flex example.l
    gcc lex.yy.c 
    ```
4. Execute the generated parser:
    ```sh
    ./a.exe
    ```
