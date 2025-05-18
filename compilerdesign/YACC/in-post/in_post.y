%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<string.h>
    int yylex();
    void yyerror(const char *s);
    
    // We'll build the postfix expression using a different approach
    // using a string representation for each expression
    #define MAX_EXPR_LEN 1000
    
    // Function to create a new expression string
    char* new_expr(const char* format, ...) {
        char* str = (char*)malloc(MAX_EXPR_LEN);
        if (!str) {
            yyerror("Memory allocation failed");
            exit(1);
        }
        va_list args;
        va_start(args, format);
        vsprintf(str, format, args);
        va_end(args);
        return str;
    }
%}

%union {
    int num;
    char* expr;
}

%token <num> NUMBER
%token PLUS SUB MULTIPLY divide LP RP

/* Define precedence and associativity of operators */
%left PLUS SUB       /* lowest precedence */
%left MULTIPLY divide  /* higher precedence */

%type <expr> E
%%

S: E  { printf("\nPostfix expression: %s\n", $1); };

E: E PLUS E { 
        $$ = new_expr("%s%s+ ", $1, $3); 
        free($1); 
        free($3); 
    }
  | E SUB E { 
        $$ = new_expr("%s%s- ", $1, $3); 
        free($1); 
        free($3); 
    }
  | E MULTIPLY E { 
        $$ = new_expr("%s%s* ", $1, $3); 
        free($1);
        free($3);
    }
  | E divide E { 
        $$ = new_expr("%s%s/ ", $1, $3); 
        free($1);
        free($3);
    }
  | LP E RP { 
        $$ = $2; // Just pass through the expression string
    }
  | NUMBER { 
        $$ = new_expr("%d ", $1);
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