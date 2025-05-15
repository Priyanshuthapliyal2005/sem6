%{
    #include<stdio.h>
%}

%%

[a-z0-9][a-z.0-9]*@[a-z]+.("com"|"ac.in") {printf("%s is Valid Email Id",yytext);}
.* {printf("Invalid Email Id");}

%%

int main(){
    printf("Enter Email: ");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
