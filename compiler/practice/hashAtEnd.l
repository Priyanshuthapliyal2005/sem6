%{
    #include<stdio.h>
    #include<ctype.h>
%}

%%

[a-z]+  {
    for(int i=0 ; yytext[i]!='\0';i++){
       fprintf(yyout, "%c", toupper(yytext[i]));
    }
}

\n      {fprintf(yyout,"#\n");}
.   {fprintf(yyout,yytext);}

%%

int main(){
    yyin = fopen("lower.txt","r");
    yyout = fopen("hashed.txt","w");

    yylex();
    return 0;
}

int yywrap(){
    return 1;
}