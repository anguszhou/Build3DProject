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
				array[i] = random.nextInt(100);// 随机生成0-100的整数
			}
			System.out.println("该随机数数组各个元素为：");
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
		// 找出第k小的数字
		{
			if (r - p < 5)
			// 用冒泡排序算法对数组a[p:r]进行排序
			{
				bubbleSort(a, p, r);
				return a[p + k - 1];
			}

			// 将a[p+5*i]至a[p+5*i+4]的第3小元素与a[p+i]交换位置
			// 找中位数的中位数
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
			swap(a, max, r);// 将最大的保存到末尾
		}

		// 冒泡排序
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
		System.out.println("随机生成元素为0~99的整形数组，请输入该数组的长度：" );
		n=scanner.nextInt();
		int array[]=init_Array(n);
		long startTime = System.nanoTime();   //获取开始时间
		int k = (n + 1)/2;
		int mid = select(array, 0, n - 1, k);
		long endTime = System.nanoTime(); //获取结束时间   
		System.out.println("搜索找到中位数是： " + mid);
		System.out.println("查找花费的时间是： " + (endTime - startTime)+"ns"); 
		System.out.println("排序结果如下，验证中位数：");
		bubbleSort(array, 0, n-1);
		print_Array(array);

	}

}
