%{
    #include<stdio.h>
%}

%s A B C DEAD

%%

<INITIAL>a BEGIN A;
<INITIAL>b BEGIN B;
<INITIAL>\n {printf("accepted\n"); BEGIN INITIAL;}
<INITIAL>[^ab\n] BEGIN DEAD;


<A>a BEGIN INITIAL;
<A>b BEGIN C;
<A>\n {printf("rejected\n"); BEGIN INITIAL;}
<A>[^ab\n] BEGIN DEAD;

<B>b BEGIN INITIAL;
<B>a BEGIN C;
<B>\n {printf("rejected\n"); BEGIN INITIAL;}
<B>[^ab\n] BEGIN DEAD;

<C>a BEGIN B;
<C>b BEGIN A;
<C>[^ab\n] BEGIN DEAD;
<C>\n {printf("rejected\n"); BEGIN INITIAL;}

<DEAD>\n {printf("invalid input\n"); BEGIN INITIAL;}
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
