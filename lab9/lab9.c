#include<stdio.h>
int findlru(int time[],int n)
{
	int i,minimum=time[0],pos=0;
	for(i=1;i<n;i++)
	{
		if(time[i]<minimun)
		{
			minimum=time[i];
			pos=i;
		}
	}
	return pos;
}
int main()
{
	int f,n,frames[10],pages[100],counter,time[0],flag1,flag2,i,j,pos,format=0,count=0,avail,ch;
	printf("enter the no. of frames:");
	scanf("%d",&f);
	printf("enter the no. of pages:");
	scanf('%d",&n);
	printf("enter the referal string");
	for(i=0;i<n;i++)
	{
		
