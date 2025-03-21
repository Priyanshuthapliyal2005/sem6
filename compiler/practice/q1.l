%{
    #include<stdio.h>
    int nc=0, ns=0,nt=0, nl=0;
%}

%%
[ ]   {ns++;}
[\n]   {nl++;}
[\t]   {nt++;}
[^\t\n ]    {nc+=yyleng;}
%%

int main(){
    printf("Enter the input: \n");
    yylex();
    printf("\nThe number of lines are : %d\n\n",nl);
    printf("The number of spaces are : %d\n\n",ns);
    printf("The number of tab-meta character are : %d\n\n",nt);
    printf("The number of characters are : %d\n\n",nc);
    return 0;
}

int yywrap(){
    return 1;
}