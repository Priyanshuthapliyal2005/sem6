%{
    #include<stdio.h>
%}

%%

"//".*    {fprintf(yyout,"");}
"/\*\*"|"/\*"([^*]|\*+[^/*])*\*+"/" {fprintf(yyout,"");}
.  {fprintf(yyout,yytext);}
%%

int main(){
    yyin = fopen("CommentExample.java", "r");
    yyout = fopen("out.java", "w");

    yylex();

    fclose(yyin);
    fclose(yyout);

    return 0;
}

int yywrap(){
    return 1;
}
