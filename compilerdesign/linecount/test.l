%{
    #include<stdio.h>
    int linecount=0, spacecount=0, tabcount=0, restcount=0;
%}

%%
        
[\n] {++linecount;}
[" "] {++spacecount;}
[\t] {++tabcount;}
[^\t" "\n] {++restcount;}

%%

int main(){
    printf("Enter the sentence: \n");
    yylex();
    printf("number of lines are: %d\n",linecount);
    printf("number of spaces are: %d\n",spacecount);
    printf("number of tabs characters are: %d\n",tabcount);
    printf("number of rest characters are: %d\n",restcount);
    return 0;
}
int yywrap(){
    return 1;
}                                  