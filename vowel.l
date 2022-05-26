%{
#include<stdio.h>
int vow=0,con=0;
%}
%%
[aeiouAEIOU] {vow++;}
[b-df-hj-np-tw-z]+ {con++;}
"\n" {printf("vowels %d \n consonents %d\n",vow,con); vow=0;con=0;}
%%
int yywrap() {}
int main()
{
yylex();
return 0;
}
