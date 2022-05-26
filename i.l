%{
#include<stdio.h>
%}
%%
[a-zA-Z_]+[0-9]* {printf("valid identifer\n");}
[0-9@#$%^&*()-+]+[a-zA-Z_]* {printf("invalid identifer\n");}
%%
int yywrap() {}
int main()
{
yylex();
return 0;
}
