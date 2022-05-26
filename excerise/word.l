%{
#include<stdio.h>
int i=0;
%}
%%
[a-zA-z0-9]+ {i++;}
"\n" {printf("%d\n",i); i=0;}
%%
int yywrap() {}
int main()
{
yylex();
return 0;
}
