%{
    #include<stdio.h>
%}

%s INT ID FLOAT A DEAD

%%
<INITIAL>[0-9] BEGIN INT;
<INITIAL>\. BEGIN A;
<INITIAL>[a-zA-Z_] BEGIN ID;
<INITIAL>\n printf("Enter a string:\n");BEGIN INITIAL;
<INITIAL>[^\n0-9a-zA-Z_.]BEGIN DEAD;

<INT>[0-9] BEGIN INT;
<INT>[.] BEGIN A;
<INT>\n printf("Integer is accepted\n");BEGIN INITIAL;
<INT>[^\n0-9.]BEGIN DEAD;

<A>[0-9] BEGIN FLOAT;
<A>[^\n0-9.] BEGIN DEAD;
<A>\n printf("not accepted neither integer nor float");BEGIN INITIAL;

<FLOAT>[0-9] BEGIN FLOAT;
<FLOAT>[^\n0-9] BEGIN DEAD;
<FLOAT>\n printf("Float is accepted\n");BEGIN INITIAL;

<ID>[a-zA-Z_] BEGIN ID;
<ID>[^\na-zA-Z_] BEGIN DEAD;
<ID>\n printf("Identifier is accepted\n");BEGIN INITIAL;

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL;


%%

int main(){
    printf("Enter a input integer , float or Identifier : \n ");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}