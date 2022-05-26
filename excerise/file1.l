%%
"hi" {printf("welcome");}
.	;
%%
int yywrap() {}
int main()
{
yylex();
return 0;
}
