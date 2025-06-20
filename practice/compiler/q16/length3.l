%{
    #include<stdio.h>
%}

%s A B DEAD

%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN A;
<INITIAL>\n {printf("String length mod 3 = 0 - ACCEPTED\n"); BEGIN INITIAL;}
<INITIAL>[^ab\n] BEGIN DEAD;

<A>a BEGIN B;
<A>b BEGIN B;
<A>\n {printf("String length mod 3 = 1 - REJECTED\n"); BEGIN INITIAL;}
<A>[^ab\n] BEGIN DEAD;

<B>a BEGIN INITIAL;
<B>b BEGIN INITIAL;
<B>\n {printf("String length mod 3 = 2 - REJECTED\n"); BEGIN INITIAL;}
<B>[^ab\n] BEGIN DEAD;

<DEAD>\n {printf("Invalid input - contains non-a/b characters\n"); BEGIN INITIAL;}
<DEAD>[^\n] BEGIN DEAD;
%%

int main(){
    printf("Enter a string : ");
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}

