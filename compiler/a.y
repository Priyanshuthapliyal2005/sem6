%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(const char *s);
    int yylex();
%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%%
stmnt: 
 expr '\n' {printf("result: %d\n",$1);};
expr: 
 expr'+'expr {$$=$1+$3;}
|expr'-'expr {$$=$1-$3;}
|expr'*'expr {$$=$1 * $3;}
|expr'/'expr {if($3==0) {yyerror("div by 0"); YYABORT;} $$=$1/$3;}
|NUMBER {$$=$1;} ;
%%
void yyerror(const char *s) {
    fprintf(stderr,"error %s",s);
}
int main() {
    printf("enter expression\n");
    yyparse(); 
    return 0;
}