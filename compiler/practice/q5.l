%{
    #include<stdio.h>
    int nc=0,nw=0,nl=0,ns=0;
%}

%%
\n          {nl++;}
[ \t]+      {ns++;}
[^ \t\n]+   {nc+=yyleng; nw++;}
%%

int main(){
    yyin=fopen("input.txt","r");
    yyout=fopen("output.txt","w");
    yylex();
    fprintf(yyout,"Number of characters: %d\n",nc);
    fprintf(yyout,"Number of words: %d\n",nw);
    fprintf(yyout,"Number of lines: %d\n",nl);
    fprintf(yyout,"Number of spaces: %d\n",ns);
    return 0;
}

int yywrap(){
    return 1;
}