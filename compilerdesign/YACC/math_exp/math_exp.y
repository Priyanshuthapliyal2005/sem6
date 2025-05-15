%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    void yyerror(const char *s);
%}

%token NUMBER PLUS SUB MULTIPLY divide LP RP
%%

E: E PLUS E 
| E SUB E 
| E MULTIPLY E 
| E divide E 
| LP E RP 
| NUMBER;

%%

int main(){
    printf("Enter an expression: ");
    if(yyparse()==0){
        printf("valid expression\n");
    }else{
        printf("invalid expression\n");
    }
    return 0;
}

void yyerror(const char *s){
    printf("SYNTAX ERROR\n",s);
}