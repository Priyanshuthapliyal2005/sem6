%{
    #include<stdio.h>
%}

%s A B DEAD
%%

<INITIAL>[ab] BEGIN A;
<INITIAL>\n printf("valid string.\n"); BEGIN INITIAL;
<INITIAL>[^ab\n] BEGIN DEAD;

<A>[ab] BEGIN B;
<A>\n printf("Invalid string\n"); BEGIN INITIAL;
<A>[^ab\n] BEGIN DEAD;

<B>[ab] BEGIN INITIAL;
<B>\n printf("Invalid string\n"); BEGIN INITIAL;
<B>[^ab\n] BEGIN DEAD;

<DEAD>\n printf("Invalid string\n"); BEGIN INITIAL;
<DEAD>[^\n] ;

%%
int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}