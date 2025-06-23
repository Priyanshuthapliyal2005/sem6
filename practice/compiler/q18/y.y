%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    void yyerror(const char* s);
%}

%token NUM MUL PLUS MINUS DIV LP RP 

%%
E: E PLUS E
 | E MINUS E
 | E MUL E
 | E DIV E
 | LP E RP
 | NUM
 ;
%%

int main(){
    printf("Enter an expression:");
    if(yyparse()==0){
        printf("valid expression.\n");
        }
    else{
        printf("invalid expression.\n");
    }
    return 0;
}

void yyerror(const char* s){
    printf("\nSyntax Error: %s\n", s);
}