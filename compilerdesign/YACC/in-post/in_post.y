%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    void yyerror(const char *s);
%}

%token NUMBER PLUS SUB MULTIPLY divide LP RP
%%

E: E PLUS E { printf("%s %s + ", $1, $3); }
| E SUB E { printf("%s %s - ", $1, $3); }
| E MULTIPLY E { printf("%s %s * ", $1, $3); }
| E divide E { printf("%s %s / ", $1, $3); }
| LP E RP { $$ = $2; }
| NUMBER { printf("%d ", $1); }
;

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