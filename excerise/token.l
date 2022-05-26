%{
#include<stdio.h>
int iden=0,key=0,op=0;
%}
%%
int|float|double|end|if|for|while|return|do|switch {key++;}
[a-zA-Z_]*[0-9]* {iden++;}
[+|-|%|*|\|=] {op++;}
"\n" {printf("identifer %d \n keyword %d\n operator %d\n\n",iden,key,op); iden=0;key=0;op=0;}
%%
int yywrap() {}
int main()
{
yylex();
return 0;
}
