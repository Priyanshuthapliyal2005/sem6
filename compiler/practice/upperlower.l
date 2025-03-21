%{
    #include<stdio.h>
%}

%%
[A-Z]+  {
    for(int i=0 ; yytext[i]!='\0'; i++){
        yytext[i]+=32;
    }
    fprintf(yyout,yytext);
}

. {fprintf(yyout,yytext);}
%%

int main(){
    yyin = fopen("upper.txt","r");
    yyout = fopen("lower.txt","w");

    yylex();

    return 0 ;
}

int yywrap(){
    return 1;
}