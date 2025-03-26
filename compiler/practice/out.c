#include<stdio.h>

int main(){
    char ip[16];
    printf("Enter the IP address: ");
    scanf("s",ip);
    int i=0,j=0,flag=0;
    while(ip[i]!='\0'){
        if(ip[i]=='.'){
            if(j==0 || j>3){
                flag=1;
                
            }
        }

        
        
        else{
            flag=1;
        }
        i++;
    }

    if(flag==1){
        printf("Invalid IP address");
    }
    
    else{
        printf("Valid IP address");
    }
    return 0;
}

