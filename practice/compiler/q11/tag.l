%{
    #include<stdio.h>
%}


%%
"<"[^>]*">" {fprintf(yyout,"%s\n",yytext);}
.|\n    {}
%%

int main(){
    extern FILE *yyin, *yyout;
    yyin = fopen("input.html","r");
    yyout = fopen("output.html","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap(){
    return 1;
    }