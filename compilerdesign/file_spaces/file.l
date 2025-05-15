%{
    #include<stdio.h>
    int tc=0, tw=0, ts=0;
%}

%%

[\n\t ] {ts++;}
[^\n\t ]+ {tw++; tc=tc+yyleng;}

%%

int main(){
    yyin=fopen("input.txt","r");
    yylex();
    printf("total spaces : %d\ntotal words : %d\ntotal characters : %d",ts,tw,tc);
    return 0;
}
int yywrap(){
    return 1;
}
