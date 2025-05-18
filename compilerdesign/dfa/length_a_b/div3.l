%{
    #include<stdio.h>
%}

%s A B C D E F G H I DEAD
%%

<INITIAL>a BEGIN B;
<INITIAL>b BEGIN D;
<INITIAL>\n printf("Valid string.\n"); BEGIN INITIAL;
<INITIAL>[^ab\n] BEGIN DEAD;

<B>a BEGIN C;
<B>b BEGIN E;
<B>\n printf("Invalid string.\n"); BEGIN INITIAL;
<B>[^ab\n] BEGIN DEAD;

<C>a BEGIN A;
<C>b BEGIN F;
<C>\n printf("Invalid string.\n"); BEGIN INITIAL;
<C>[^ab\n] BEGIN DEAD;

<D>a BEGIN E;
<D>b BEGIN G;
<D>\n printf("Invalid string.\n"); BEGIN INITIAL;
<D>[^ab\n] BEGIN DEAD;

<E>a BEGIN F;
<E>b BEGIN H;
<E>\n printf("Invalid string.\n"); BEGIN INITIAL;
<E>[^ab\n] BEGIN DEAD;

<F>a BEGIN D;
<F>b BEGIN I;
<F>\n printf("Invalid string.\n"); BEGIN INITIAL;
<F>[^ab\n] BEGIN DEAD;

<G>a BEGIN H;
<G>b BEGIN A;
<G>\n printf("Invalid string.\n"); BEGIN INITIAL;
<G>[^ab\n] BEGIN DEAD;

<H>a BEGIN I;
<H>b BEGIN B;
<H>\n printf("Invalid string.\n"); BEGIN INITIAL;
<H>[^ab\n] BEGIN DEAD;

<I>a BEGIN G;
<I>b BEGIN C;
<I>\n printf("Invalid string.\n"); BEGIN INITIAL;
<I>[^ab\n] BEGIN DEAD;

<A>a BEGIN B;
<A>b BEGIN D; 
<A>\n printf("Valid string.\n"); BEGIN INITIAL;
<A>[^ab\n] BEGIN DEAD;

<DEAD>\n printf("Invalid String.\n"); BEGIN INITIAL;
<DEAD>[^\n] BEGIN DEAD;

%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}



// design a dfa in lex code over sigma a,b for a language that accepts number of a and number of b divisible by 3

