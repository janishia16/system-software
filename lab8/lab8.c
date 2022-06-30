#include<stdio.h>
int max[10][10],allocation[10][10],need[10][10];
int avail[10];
int nr,np;
void readmatrix(int matrix [10][10])
{
	int i,j;
	for(int i=0;i<np;i++)
	{
		for(j=0;j<nr;j++)
			scanf("%d",&matrix[i][j]);
	}
}
void calculate_need()
{
	int i,j;
	for(int i=0;i<np;i++)
		for(j=0;j<nr;j++)
			need[i][j]=max[i][j]-allocation[i][j];
}
void banker()
{
	int i,j,k=0,flag;
	int finish[10],safe_seq[10];
	for(i=0;i<np;i++)
		finish[i]=0;
	for(i=0;i<np;i++)
	{
		flag=0;
		if(finish[i]==0)
		{
			for(j=0;j<nr;j++)
			{
				if(need[i][j]>avail[j])
				{
					flag=1;
					break;
				}
			}
			if(flag==0)
			{
				finish[i]=1;
				safe_seq[k]=i;
				k++;
				for(j=0;j<nr;j++)
					avail[j]+=allocation[i][j];
				i=-1;
			}
		}
	}
	flag=0;
	for(i=0;i<np;i++)
		if(finish[i]==0)
		{
			printf("system is in deadlock\n");
			flag=1;
			break;
		}
	if(flag==0)
	{
		printf("system is in safe the sequence\n");
		for(i=0;i<np;i++)
			printf("p%d\n",safe_seq[i]);
	}
}
void main()
{
	int j;
	printf("enter the number of process:");
	scanf("%d",&np);
	printf("enter the number of resources:");
	scanf("%d",&nr);
	printf("enter maximum requirement matrix:\n");
	readmatrix(max);
	printf("enter allocated matrix:\n");
	readmatrix(allocation);
	printf("enter avaiable resources:");
	for(j=0;j<nr;j++)
		scanf("%d",&avail[j]);
	calculate_need();
	banker();
	return 0;
}
