%{
#include<stdio.h>
int sl=0,ml=0,flag=0;
%}
%%
"//".* {sl++;}
"/*" {flag=1;}
"*/" {flag=0;ml++;}
. {if(flag==0) ECHO;}
%%
int yywrap(){}
int main()
{
	yyin=fopen("prgrm.c","r");
	yyout=fopen("new.c","w");
	yylex();
	if(flag==0)
	{
		printf("single comment=%d\nmultiline comment=%d\n",sl,ml);
	}
}
