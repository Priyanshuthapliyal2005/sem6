%{
    #include<stdio.h>
    #include<string.h>
%}

%%
[^\n]*\n {
    if(yyleng - 1 >= 0 )
        fwrite(yytext, yyleng - 2, 1, yyout); /* Write the line without the newline */
    fputc('#', yyout); 
    fputc('\n', yyout);                     /* Add the '#' */
}
%%

int main(){
    yyin=fopen("input.txt", "r");
    yyout=fopen("output.txt", "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}
int yywrap(){
    return 1;
}