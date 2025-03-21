%{
    #include<stdio.h>
%}

%%
"const"|"auto"|"for"|"do" {printf("\n valid keyword\n");}
[a-zA-Z_][a-zA-Z0-9_]*   {printf("\nValid identifier\n\n");}
[ \t\n]+    {}
.*  {printf("\ninvalid identifier\n\n");}
%%

int main(){
    printf("Enter the input: ");
    yylex();
}

int yywrap(){
    return 1;
}