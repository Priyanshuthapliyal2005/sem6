%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    void yyerror(const char *S);
%}

%token NUM PLUS MINUS MULTIPLY DIVIDE LPAREN RPAREN NEWLINE
%left PLUS MINUS
%left MULTIPLY DIVIDE

%%

S: E {printf("Result:%d",$1);}
E: E PLUS E {$$=$1+$3;}
 | E MINUS E {$$=$1-$3;}
 | E MULTIPLY E {$$=$1*$3;}
 | E DIVIDE E {$$=$1/$3;}
 | LPAREN E RPAREN {$$=$2;}
 | NUM {$$=$1;}
 ;

%%

int main(){
    printf("Enter the values you want calculated:\n");
    yyparse();
    return 0;
}

void yyerror(const char *S){
    printf("Error");
}
