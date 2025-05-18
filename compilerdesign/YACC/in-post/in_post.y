%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<string.h>
    int yylex();
    void yyerror(const char *s);
    
    char postfix[1000]; // Buffer for storing postfix expression
    
    // Function to append a string to the postfix buffer
    void append(const char* str) {
        strcat(postfix, str);
    }
    
    // Function to convert an integer to string and append it
    void append_num(int num) {
        char buffer[20];
        sprintf(buffer, "%d ", num);
        append(buffer);
    }
%}

%union {
    int num;
}

%token <num> NUMBER
%token PLUS SUB MULTIPLY divide LP RP

/* Define precedence and associativity of operators */
%left PLUS SUB       /* lowest precedence */
%left MULTIPLY divide  /* higher precedence */

%type <num> E
%%

S: E  { printf("\nPostfix expression: %s\n", postfix); };

E: E PLUS E { 
        append("+ "); 
        $$ = $1 + $3; 
    }
  | E SUB E { 
        append("- "); 
        $$ = $1 - $3; 
    }
  | E MULTIPLY E { 
        append("* "); 
        $$ = $1 * $3; 
    }
  | E divide E { 
        append("/ "); 
        $$ = $1 / $3; 
    }
  | LP E RP { 
        $$ = $2; 
    }
  | NUMBER { 
        $$ = $1; 
        append_num($1);
    }
;

%%

int main(){
    printf("Enter an expression: ");
    postfix[0] = '\0'; // Initialize the postfix buffer to empty string
    if(yyparse()==0){
        printf("valid expression\n");
    }else{
        printf("invalid expression\n");
    }
    return 0;
}

void yyerror(const char *s){
    printf("SYNTAX ERROR: %s\n", s);
}