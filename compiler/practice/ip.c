#include<stdio.h>
/*hi

//check if the ip is valid

*/
int main(){
    char ip[16];
    printf("Enter the IP address: ");
    scanf("%s",ip);
    int i=0,j=0,flag=0;
    while(ip[i]!='\0'){
        if(ip[i]=='.'){
            if(j==0 || j>3){
                flag=1;
                
            }
        }

        //check if the ip is valid
        /*
        else if(ip[i]>='0' && ip[i]<='9'){
            j++;
        }
        */
        else{
            flag=1;
        }
        i++;
    }

    if(flag==1){
        printf("Invalid IP address");
    }
    //check if the ip is valid
    else{
        printf("Valid IP address");
    }
    return 0;
}

