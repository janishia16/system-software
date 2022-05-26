%{
#include<stdio.h>
int id=0,op=0,br=0;
%}
%%
[0-9]+ {id++;}
[+ *] {op++;}
[(] {br++;}
[)] {br--;}
. ;
%%
int yywrap(){}
int main()
{
	yylex();
	if(br==0 && id==op+1)
	{
		printf("valid expression\n");
		printf("identifier=%d\n operator=%d\n",id,op);
	}
	else
	{
		printf("invalid expression\n");
	}
}
