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
			System.out.println("��������");
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
		System.out.println("ɾ������������ǣ�");
		for(i=0;i<a.length;i++)
		{
			System.out.print(a[i]);
		}
	}	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int  n,k;
		String tmp;
		System.out.println("��������������λ����");
		Scanner scanner = new Scanner(System.in);// ʵ����һ��Scanner����
		n=scanner.nextInt();                  // �Ӽ�������һ��������ֵ��n��
		System.out.println("��������λ�� n="+n);
		
		System.out.println("������Ҫɾ����λ����");
		k=scanner.nextInt();                  
		System.out.println("Ҫɾ����λ�� k="+k);
		
		char []a=new char[n];
		System.out.println("�밴λ������������");
		for(int i=0;i<n;i++)
		{
			tmp=scanner.next();
			a[i]=tmp.charAt(0);
		}
		System.out.println("��������������ǣ�");
		for(int i=0;i<n;i++)
		{
			System.out.print(a[i]);
		}
		delete(a,k);
		System.out.println();
	}

}
