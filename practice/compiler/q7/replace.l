%{
    #include<stdio.h>
%}


%%
[\t ]+  {fprintf(yyout," ");}
.   {fprintf(yyout,"%s",yytext);}
%%


int main(){
    yyin = fopen("input.txt","r");
    yyout = fopen("output.txt","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}


int yywrap(){
    return 1;
}