package suanfa;

import java.util.Scanner;


public class DelNum {

	public static char[] remove(char [] a, int n)
	{
		char []tmp=new char[a.length-1];
		for(int i=0;i<n;i++)
		{
			tmp[i]=a[i];
		}
		for(int i=n;i<a.length-1;i++)
		{
			tmp[i]=a[i+1];
		}
		return tmp ;
	}	
	
	public static void delete(char [] a,int k)
	{
		int i,m=a.length;
		if(k>=m)
		{
			System.out.println("输入有误！");
			return;
		}
		while(k>0)
		{
			for(i=0;(i<a.length-1)&&(a[i]<=a[i+1]);i++);
			a=remove(a,i);
			k--;
		}
		while(a.length>1&&a[0]=='0')
		 remove(a,0);
		System.out.println("删除后的正整数是：");
		for(i=0;i<a.length;i++)
		{
			System.out.print(a[i]);
		}
	}	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int  n,k;
		String tmp;
		System.out.println("请输入正整数的位数：");
		Scanner scanner = new Scanner(System.in);// 实例化一个Scanner对象；
		n=scanner.nextInt();                  // 从键盘输入一个整数赋值给n；
		System.out.println("正整数的位数 n="+n);
		
		System.out.println("请输入要删除的位数：");
		k=scanner.nextInt();                  
		System.out.println("要删除的位数 k="+k);
		
		char []a=new char[n];
		System.out.println("请按位输入正整数：");
		for(int i=0;i<n;i++)
		{
			tmp=scanner.next();
			a[i]=tmp.charAt(0);
		}
		System.out.println("你输入的正整数是：");
		for(int i=0;i<n;i++)
		{
			System.out.print(a[i]);
		}
		delete(a,k);
		System.out.println();
	}

}
