%{
    #include<stdio.h>
%}

%option noyywrap

%s INTEGER IDENTIFIER A FLOAT DEAD

%%

<INITIAL>[0-9]                 { BEGIN(INTEGER); }
<INITIAL>[a-zA-Z_]            { BEGIN(IDENTIFIER); }
<INITIAL>[^0-9.a-zA-Z_\n]     { BEGIN(DEAD); }
<INITIAL>[.]                  { BEGIN(A); }
<INITIAL>[\n]                 { printf("Empty String\n"); }

<INTEGER>[0-9]                { /* stay in INTEGER */ }
<INTEGER>[.]                  { BEGIN(A); }
<INTEGER>[^0-9.\n]            { BEGIN(DEAD); }
<INTEGER>[\n]                 { printf("Integer\n"); BEGIN(INITIAL); }

<IDENTIFIER>[0-9a-zA-Z_.]     { /* stay in IDENTIFIER */ }
<IDENTIFIER>[^0-9a-zA-Z_.\n]  { BEGIN(DEAD); }
<IDENTIFIER>[\n]              { printf("Identifier\n"); BEGIN(INITIAL); }

<A>[0-9]                      { BEGIN(FLOAT); }
<A>[^0-9\n]                   { BEGIN(DEAD); }
<A>[\n]                       { printf("NOT INT NOR FLOAT\n"); BEGIN(INITIAL); }

<FLOAT>[0-9]                  { /* stay in FLOAT */ }
<FLOAT>[^0-9\n]               { BEGIN(DEAD); }
<FLOAT>[\n]                   { printf("Float\n"); BEGIN(INITIAL); }

<DEAD>[^\n]                   { /* stay in DEAD */ }
<DEAD>[\n]                    { printf("Invalid Token\n"); BEGIN(INITIAL); }

%%

int main() {
    yylex();
    return 0;
}
