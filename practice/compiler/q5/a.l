%{
    #include<stdio.h>
    int tc=0, tw=0,ts=0;
%}

%%

[\n\t ] {ts++;}
[^\n\t ]+    {tw++;tc+=yyleng;}

%%


int main(){
    yyin = fopen("input.txt","r");
    yylex();
    printf("Total white Spaces: %d\n",ts);
    printf("Total words: %d\n",tw);
    printf("Total characters: %d\n",tc);
    return 0;
}

int yywrap(){
    return 1;
}