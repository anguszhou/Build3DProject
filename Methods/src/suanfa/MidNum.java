package suanfa;

import java.util.Random;
import java.util.Scanner;

public class MidNum {
		
		public static int[] init_Array(int n)
		{
			Random random = new Random();
			int[] array = new int[n];
			for(int i=0;i<n;i++)
			{
				array[i] = random.nextInt(100);// �������0-100������
			}
			System.out.println("��������������Ԫ��Ϊ��");
			print_Array(array);
			return array;
		}
		
		public static void print_Array(int array[])
		{
			for (int i = 1; i < array.length+1; i++) 
			{
				if(i%11!=0)
				{
				System.out.print(array[i-1]);
				System.out.print(" ");
				}
				else
				{
					System.out.println();
					System.out.print(array[i-1]);
					System.out.print(" ");
					}
				
			}
			System.out.println();
		}
		
		public static void swap(int array[],int a,int b)
		{
			int temp = array[a];
			array[a] = array[b];
			array[b] = temp;
		}

		private static int select(int[] a, int p, int r, int k)
		// �ҳ���kС������
		{
			if (r - p < 5)
			// ��ð�������㷨������a[p:r]��������
			{
				bubbleSort(a, p, r);
				return a[p + k - 1];
			}

			// ��a[p+5*i]��a[p+5*i+4]�ĵ�3СԪ����a[p+i]����λ��
			// ����λ������λ��
			for (int i = 0; i <= (r - p - 4) / 5; i++)
			{
				int s = p + 5 * i, t = s + 4;
				for (int j = 0; j < 3; j++)
				{
					bubble(a, s, t - j);
				}
				swap(a, p + i, s + 2);
			}
			int x = select(a, p, p + (r - p - 4) / 5, (r - p + 6) / 10);
			int i = partion(a, p, r, x);
			int j = i - p + 1;
			if (k <= j)
				return select(a, p, i, k);
			else
				return select(a, i + 1, r, k - j);
		}
		private static int partion(int[] a, int p, int r, int y)
		{
			for (int i = p; i <= r; i++)
				if (a[i] == y)
				{
					swap(a, p, i);
					break;
				}
			int i = p, j = r + 1;
			int x = a[p];
			while (true)
			{
				while (a[++i] < x && i < r);
				while (a[--j] > x && j > p);
				if (i >= j)
					break;
				swap(a, i, j);
			}
			a[p] = a[j];
			a[j] = x;
			return j;
			
		}
		private static void bubble(int[] a, int p, int r) 
		{
			int max = p;
			for (int i = p; i < r + 1; i++) 
			{
				if (a[i] > a[max]) 
				{
					max = i;
				}
			}
			swap(a, max, r);// �����ı��浽ĩβ
		}

		// ð������
		private static void bubbleSort(int[] a, int p, int r) 
		{
			for (int i = p+1, k = 0; i <= r; i ++, k ++)
			{
				for (int j = r - k; j > p; j --)
				{
					if (a[j] < a[j - 1])
						swap(a, j, j-1);
				}
			}
		}
		
		

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int n ;
		 Scanner scanner = new Scanner(System.in);
		System.out.println("�������Ԫ��Ϊ0~99���������飬�����������ĳ��ȣ�" );
		n=scanner.nextInt();
		int array[]=init_Array(n);
		long startTime = System.nanoTime();   //��ȡ��ʼʱ��
		int k = (n + 1)/2;
		int mid = select(array, 0, n - 1, k);
		long endTime = System.nanoTime(); //��ȡ����ʱ��   
		System.out.println("�����ҵ���λ���ǣ� " + mid);
		System.out.println("���һ��ѵ�ʱ���ǣ� " + (endTime - startTime)+"ns"); 
		System.out.println("���������£���֤��λ����");
		bubbleSort(array, 0, n-1);
		print_Array(array);

	}

}
