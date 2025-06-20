%{
    #include<stdio.h>

%}

%x COMMENT

%%
"<!--"           { BEGIN(COMMENT); }
<COMMENT>"-->"   { BEGIN(INITIAL); }
<COMMENT>.|\n    { /* Skip content inside comments */ }
.|\n             { fprintf(yyout,"%s",yytext); }
%%

int main(){
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