%{
    #include<stdio.h>
    int tc =0 , tw=0 , ts =0;
%}


%%

[ \n\t] {ts++;}
[^\n\t ]+ {tw++ ,tc=tc+yyleng;}

%%


int main(){
    yyin = fopen("input.txt","r");
    yylex();
    printf("Total white spaces: %d\n",ts);
    printf("Total words: %d\n",tw);
    printf("Total number of characters: %d\n",tc);
}

int yywrap(){
    return 1;
}