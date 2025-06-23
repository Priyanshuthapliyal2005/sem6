%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    void yyerror(const char *c);
%}

%token NUM PLUS MINUS MUL DIV LP RP

%%
S:E {printf("result=%d",$1);}
E:E PLUS E  {$$=$1+$3;}
|E MINUS E {$$=$1-$3;}
|E MUL E  {$$=$1*$3;}
|E DIV E  {
    if($3 == 0){
        yyerror("divide by 0");
        YYABORT;
    }
    $$= $1/$3;
}
|LP E RP    {$$=$2;}
|NUM {$$=$1;}
;
%%

int main(){
    printf("Enter a expression: \n");
    if(yyparse()==0){
        printf("Evaluated Successfully");
    }
    else{
        printf("invalid");
    }
}

void yyerror(const char* c){
    printf("ssyntax error\n");
}

