%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    void yyerror(const char* s);
%}


%token NUM PLUS MINUS MUL DIV LP RP
%left PLUS MINUS
%left MUL DIV

%%

E:E PLUS E  {printf("+");}
|E MINUS E {printf("-");}
|E MUL E    {printf("*");}
|E DIV E    {printf("/");}
|LP E RP    {}
|NUM {printf("%d",$1);}
;

%%

int main(){
    printf("Enter an expression: ");
    yyparse();
    return 0;
}

void yyerror(const char* c){
    printf("syntax error\n");
}