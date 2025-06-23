%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    void yyerror(const char* s);
%}

%token NUM PLUS MINUS MUL DIV LP RP 

%%
S: E    {printf("Result: %d\n", $1);}
E:  E PLUS E {$$ = $1+$3;}
    | E MINUS E {$$ = $1-$3;}
    | E MUL E {$$ = $1*$3;}    
    | E DIV E {
        if($3 != 0){
            $$ = $1/$3;
        } else {
            yyerror("Division by zero");
            YYABORT;
        }
    }    
    | LP E RP {$$ = $2;}
    | NUM {$$ = $1;}
    ;
%%

int main(){
    printf("Enter an Expression: ");
    if(yyparse() == 0){
        printf("Evaluated Successfully\n");
    } else {
        printf("Invalid expression\n");
    }
    return 0;
}

void yyerror(const char* s){
    printf("Error: %s\n", s);
}