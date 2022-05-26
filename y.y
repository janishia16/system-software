%{
#include<stdio.h>
#include<stdlib.h>
int yyerror();
int yylex();
%}
%token NUM ENTER
%left '+' '-'
%left '/' '*'
%%
	START : expr ENTER {printf("Result=%d",$$);exit(0);}
	expr:	  expr '+' expr {$$=$1+$3;}
			| expr '-' expr {$$=$1-$3;}
			| expr '*' expr {$$=$1*$3;}
		 	| expr '/' expr {if ($3==0){printf("divide by zro error\n"); exit(0);}
		 					else{$$=$1/$3;}}
		 	| '-' expr {$$=-$2;}
		 	| '('expr')' {$$=$2;}
		 	| NUM {$$=$1;}
%%
void main()
{
printf("enter the expression:");
yyparse();
}
int yyerror()
{
printf("invalid expression");
return(0);
}
