%{
    #include<stdio.h>
%}

%s A B DEAD

%%

<INITIAL>a BEGIN A;
<INITIAL>[^a\n] BEGIN DEAD;
<INITIAL>\n {printf("Empty string - rejected\n"); BEGIN INITIAL;}

<A>a BEGIN A;
<A>b BEGIN B;
<A>[^ab\n] BEGIN DEAD;
<A>\n {printf("String rejected - doesn't end with 'b'\n"); BEGIN INITIAL;}

<B>b BEGIN B;
<B>a BEGIN A;
<B>[^ab\n] BEGIN DEAD;
<B>\n {printf("String accepted - ends with 'b'\n"); BEGIN INITIAL;}

<DEAD>\n {printf("String invalid - contains invalid characters\n"); BEGIN INITIAL;}
<DEAD>[^\n] BEGIN DEAD;

%%

int main(){
    printf("Enter a string:\n");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
