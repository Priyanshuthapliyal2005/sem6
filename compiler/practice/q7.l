%{
    #include<stdio.h>
%}


%%
"//".*  {}
"/\*"([^*]|)
%%


int main(){
    yyin=fopen("ip.c","r");
    yyout=fopen("op.c","w");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}