%{
#include<stdio.h>
int pos=0,neg=0;
%}
%%
[0-9]+ {pos++;}
-[0-9]+ {neg++;}
"\n" {printf("positive number %d \n negative number %d\n",pos,neg); pos=0;neg=0;}
return pos,neg;
%%
int yywrap() {}
int main()
{
yylex();
return 0;
}
