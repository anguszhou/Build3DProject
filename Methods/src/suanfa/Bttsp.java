package suanfa;


	public class Bttsp
	{
		static int n;		//G�Ķ�����
		static int []x;		//��ǰ��
		static int []bestx; //��ǰ���Ž�
		static float bestc; //��ǰ����ֵ
		static float cc;    //��ǰ����
		
		
	 	static float[][] a = {
	 		{Float.MAX_VALUE,Float.MAX_VALUE,Float.MAX_VALUE,Float.MAX_VALUE,Float.MAX_VALUE},
	 		{Float.MAX_VALUE,Float.MAX_VALUE,13,9,16},
	 		{Float.MAX_VALUE,11,Float.MAX_VALUE,17,23},
	 		{Float.MAX_VALUE,18,26,Float.MAX_VALUE,14},
	 		{Float.MAX_VALUE,28,29,7,Float.MAX_VALUE}
	 		};
		 public static void main(String[] args)
		 {
			 int[] v = {0,1,2,3,4};
			 float result = 0;
			 n = v.length - 1;
			 result = tsp(v);
			 System.out.print("������С��·���ǣ�");
			 /*for(int element:bestx)
			 	if(element != 0)
			 		System.out.print(element + "---");*/
			 for (int i = 1; i < v.length; i ++)
			 {
				 System.out.print(bestx[i] + "--->");
			 }
			 System.out.println('1');
			 System.out.print("��������СȨֵ�ǣ�");
			 System.out.print(result);
		 }
	 	
	 	 public static float tsp(int[] v)
	 	 {
	 	 	//x �ĵ�λ����
	 		 x = new int[n+1];
			 for(int i = 1;i <= n;i++)
			   x[i] = i;
			 bestc = Float.MAX_VALUE;
			 bestx = v;
			 cc = 0;
			 //����x[2:n]��ȫ����
			 backtrack(2);
			 return bestc;
	 	 }
	 	 private static void backtrack(int i)
	 	 {
	 		 if(i == n)
			 {
	 			 if(a[x[n-1]][x[n]] < Float.MAX_VALUE &&
				   a[x[n]][1] < Float.MAX_VALUE &&
				   (bestc == Float.MAX_VALUE || 
				    cc + a[x[n-1]][x[n]] + a[x[n]][1] < bestc))
				 {
	 				 for(int j = 1;j <= n;j++)
	 					 bestx[j] = x[j];
					 bestc = cc + a[x[n-1]][x[n]] + a[x[n]][1];
				 }
			 }
			 else
			 {
				 for(int j = i;j <= n;j++)
				  //�Ƿ���Խ���x[j]������
				 {
					 if(a[x[i-1]][x[j]] < Float.MAX_VALUE &&
							 (bestc == Float.MAX_VALUE ||
									 cc + a[x[i-1]][x[j]] < bestc))
					 {
					  	//��������
						 Bttsp.swap(x,i,j);
					  	 cc += a[x[i-1]][x[i]];
					  	 backtrack(i+1);
					  	 cc -= a[x[i-1]][x[i]];
					     Bttsp.swap(x,i,j);
					 }
				 }
			 }
	 	 }
	 	 public static void swap(int[] x,int i,int j)
	 	 {
	 		 int temp;
			 temp = x[i];
			 x[i] = x[j];
			 x[j] = temp;
		}
	}

	


