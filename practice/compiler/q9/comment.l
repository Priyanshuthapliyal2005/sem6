%{
    #include<stdio.h>
    FILE *yyin,*yyout;
%}

%%
"//".*  {fprintf(yyout,"");}
"/\**"([^*]|\*+[^/*])*\*+"/"   {fprintf(yyout,"");}
.   {fprintf(yyout,"%s",yytext);}
%%

int main(){
    yyin = fopen("SimpleCalculator.java","r");
    yyout = fopen("output.java","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap(){
    return 1;
}