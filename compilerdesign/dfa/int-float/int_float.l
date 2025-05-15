%{
    #include<stdio.h>
%}

%s INTEGER A FLOAT IDENTIFIER DEAD

%%

<INITIAL>[0-9] BEGIN INTEGER; 
<INITIAL>\. BEGIN A; 
<INITIAL>[a-zA-Z_] BEGIN IDENTIFIER;
<INITIAL>\n printf("Please enter a string.\n"); BEGIN INITIAL;
<INITIAL>[^a-zA-Z_0-9\n.] BEGIN DEAD;

<INTEGER>[0-9] BEGIN INTEGER;
<INTEGER>\. BEGIN A;
<INTEGER>\n printf("Integer\n"); BEGIN INITIAL;
<INTEGER>[^0-9\n.] BEGIN DEAD;

<A>[0-9] BEGIN FLOAT;
<A>\n printf("wrong string\n");BEGIN INITIAL;
<A>[^0-9\n] BEGIN DEAD;

<FLOAT>[0-9] BEGIN FLOAT;
<FLOAT>\n printf("Float\n"); BEGIN INITIAL;
<FLOAT>[^0-9\n] BEGIN DEAD;

<IDENTIFIER>[a-zA-Z_0-9] ;
<IDENTIFIER>\n printf("identifier\n"); BEGIN INITIAL;
<IDENTIFIER>[^A-Za-z_0-9] BEGIN DEAD;

<DEAD>\n printf("Invalid String\n"); BEGIN INITIAL;
<DEAD>[^\n] ; 

%%

int main(){
    printf("Enter a sting: ");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}

