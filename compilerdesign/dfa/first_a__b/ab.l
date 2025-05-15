%{
    #include<stdio.h>
%}

%s A B DEAD

%%

<INITIAL>a BEGIN A;
<INITIAL>\n printf("Enter a string.\n"); BEGIN INITIAL;
<INITIAL>[^a\n] BEGIN DEAD;

<A>a ;
<A>b BEGIN B;
<A>\n printf("Invalid string.\n"); BEGIN INITIAL;
<A>[^ab\n] BEGIN DEAD;

<B>a BEGIN A;
<B>b ;
<B>\n printf("Valid string.\n"); BEGIN INITIAL;
<B>[^ab\n] BEGIN DEAD;

<DEAD>\n printf("Invalid string.\n"); BEGIN INITIAL;
<DEAD>[^\n] ;

%%

int main(){
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}