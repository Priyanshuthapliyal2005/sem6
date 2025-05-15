%{
    #include<stdio.h>
%}

%s A B C DEAD

%%

<INITIAL>a BEGIN A;
<INITIAL>b BEGIN B;
<INITIAL>\n printf("accepted\n"); BEGIN INITIAL;
<INITIAL>[^ab\n] BEGIN DEAD;

<A>a BEGIN INITIAL;
<A>b BEGIN C;
<A>[^ab\n] BEGIN DEAD;
<A>\n printf("not accepted\n"); BEGIN INITIAL;

<B>b BEGIN INITIAL;
<B>a BEGIN C;
<B>[^ab\n] BEGIN DEAD;
<B>\n printf("not accepted\n"); BEGIN INITIAL;

<C>a BEGIN B;
<C>b BEGIN A;
<C>[^ab\n] BEGIN DEAD;
<C>\n printf("not accepted\n"); BEGIN INITIAL;

<DEAD>\n printf("Invalid input\n"); BEGIN INITIAL;
<DEAD>[^\n] BEGIN DEAD;

%%

int main(){
    printf("Enter a string : ");
    yylex();
}
int yywrap(){
    return 0;
}
