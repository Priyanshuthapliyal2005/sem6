%{
    #include<stdio.h>
    #include<ctype.h>
%}

%%

[a-z]+  {
    for(int i=0 ; yytext[i]!='\0';i++){
        fprintf(yyout,"%c",toupper(yytext[i]));}
    }
.   {fprintf(yyout,yytext);}

%%

int main(){
    yyin = fopen("lower.txt","r");
    yyout = fopen("upper.txt","w");

    yylex();
    return 0;
}

int yywrap(){
    return 1;
}