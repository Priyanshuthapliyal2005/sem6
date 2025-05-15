%{
    #include<stdio.h>
%}

%%

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" {printf("Valid keyword");}
.* {printf("Not a valid keyword");}

%%

int main(){
    printf("Enter a word: ");
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}