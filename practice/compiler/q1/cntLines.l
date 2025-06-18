%{
#include<stdio.h>
int line =0 , word =0 ,space =0, tab =0, charc =0 ;
%}

%%
[\n] {line++; word++;}
[\t] {tab++; word++;}
[ ] {space++; word++;}
. {charc++;}
%%

int main(){
    yylex();
    printf("Lines : %d\n",line);
    printf("Words : %d\n",word);
    printf("Spaces : %d\n",space);
    printf("Tabs : %d\n",tab);
    printf("Characters : %d\n",charc);
    return 0;
}

int yywrap(){
    return 1;
}