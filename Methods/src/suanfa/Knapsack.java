package suanfa;

import java.util.Scanner;

public class Knapsack {
	
	
	public static double knapsack(double []w,double []v,double c,double [][]p,int []head)
	{
		int n=v.length-1;
		head[n+1]=0;
		p[0][0]=0;
		p[0][1]=0;
		int left =0,right=0,next=1;
		head[n]=1;
		for(int i=n;i>=1;i--)
		{
			int k=left;
			for(int j=left;j<=right;j++)
			{
				if(p[j][0]+w[i]>c) break;
				double y=p[j][0]+w[i],
				       m=p[j][1]+v[i];
				while(k<=right&&p[k][0]<y)
				{
					p[next][0]=p[k][0];
					p[next++][1]=p[k++][1];
					
				}
				if(k<=right&&p[k][0]==y)
				{
					if(m<p[k][1])  m=p[k][1];
					k++;
				}
				if(m>p[next-1][1])
				{
					p[next][0]=y;
					p[next++][1]=m;
				}
				while(k<=right&&p[k][1]<=p[next-1][1]) 
					k++;
			}
			while(k<=right)
			{
				p[next][0]=p[k][0];
				p[next++][1]=p[k++][1];
			}
			left=right+1;
			right=next-1;
			head[i-1]=next;
		}
		return p[next-1][1];
	}
	
	public static void trackback(double []w,double []v,double [][]p,int []head ,int []x)
	{
		int n=w.length-1;
		double j=p[head[0]-1][0],
		       m=p[head[0]-1][1];
		for(int i=1;i<=n;i++)
		{
			x[i]=0;
			for(int k=head[i+1];k<=head[i]-1;k++)
			{
				if(p[k][0]+w[i]==j&&p[k][1]+v[i]==m)
				{
					x[i]=1;
					j=p[k][0];
					m=p[k][1];
					break;
				}
			}
		}
		   System.out.println("装入背包的物品分别是 ：");
		   for (int i=1; i<=n; i++) 
			{
				if(x[i]==1)
			    System.out.print("第"+i+"个");
				System.out.print("  ");
			}
			System.out.println();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	   int n ;
	   double c,maxValue;
	   double [][]p=new double [100][2];
	   
	   System.out.println("请输入物品个数 ：");
	   Scanner scanner = new Scanner(System.in);// 实例化一个Scanner对象；
	   n=scanner.nextInt();                  // 从键盘输入一个整数赋值给n；
	   System.out.println("物品个数 n="+n);
	  
	   System.out.println("请输入背包重量 ：");
	   c=scanner.nextDouble();
	   System.out.println("背包重量  c="+c);
	   
	   double w[]=new double [n+1];
       double v[]=new double [n+1];
       int head[]=new int [n+2];
       int []x=new int[n+1];
       
	   System.out.println("请输入每个物品的重量 ：");
	   for(int i=1;i<=n;i++)
		   w[i]=scanner.nextDouble();
	   System.out.println(n+"个物品的重量分别是 ：");
	   for (int i=1; i<=n; i++) 
		{
			System.out.print(w[i]);
			System.out.print("  ");
		}
		System.out.println();
       
		System.out.println("请输入每个物品的价值：");
		   for(int i=1;i<=n;i++)
			   v[i]=scanner.nextDouble();
		   System.out.println(n+"个物品的价值分别是 ：");
		   for (int i=1; i<=n; i++) 
			{
				System.out.print(v[i]);
				System.out.print("  ");
			}
			System.out.println();
       
		maxValue = knapsack(w, v, c, p, head);
		System.out.println("选取的最大总价值是 ："+maxValue);
		trackback(w, v, p, head, x);
	}

}
