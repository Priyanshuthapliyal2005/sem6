%{
    #include<stdio.h>
%}

%%
"<!--"[^-]*"-->"    {fprintf(yyout,"%s","");} 
"^<!--"[^-]*"-->"    {fprintf(yyout,yytext);} 
%%

int main(){
    yyin = fopen("ip.html","r");
    yyout = fopen("op.html","w");

    yylex();

    return 0 ;
}

int yywrap(){
    return 1;
}