%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    void yyerror(const char *s);
%}

%token NUMBER PLUS SUB MULTIPLY divide LP RP
%%

S: E  {printf("Result = %d\n",$1);};

E: E PLUS E {$$ =$1 + $3;}
| E SUB E {$$ =$1 - $3;}
| E MULTIPLY E {$$ =$1 * $3;}
| E divide E {
                if($3==0){
                    yyerror("Division by zero" );
                    YYABORT;
                }
                $$ =$1 / $3;
            }
| LP E RP {$$ =$2;}
| NUMBER {$$ =$1;}
;

%%

int main(){
    printf("Enter an expression: ");
    if(yyparse()==0){
        printf("Evaluated successfully \n");
    }else{
        printf("invalid expression\n");
    }
    return 0;
}

void yyerror(const char *s){
    printf("SYNTAX ERROR\n",s);
}