%{
#include<stdio.h>
#include<stdlib.h>
int yyerror();
int yylex();
%}
%token A B ENTER
%%
	START : S ENTER {printf("valid string");exit(0);}
	S : A S | B;
%%
void main()
{
printf("enter the string:");
yyparse();
}
int yyerror()
{
printf("invalid string");
return(0);
}
