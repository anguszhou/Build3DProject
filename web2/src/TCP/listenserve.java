package TCP;

import java.io.*;
import java.net.ServerSocket;

//������һֱ���ڼ���״̬��������������һ���߳̽��д�����ʵ�ֶ���ͻ���
public class listenserve
{
	private ServerSocket welcomeSocket;
	private boolean listening=true;
	
	public listenserve()
	{
		Init();//��ʼ��
		lisn();//�������� 
	}
	public void Init()
	{
		try
		{
			welcomeSocket=new ServerSocket(6789,10);
		}
		catch(IOException ie)
		{
			System.out.println("�޷���6789�˿ڼ���");
			ie.printStackTrace();
		}
	}
	public void lisn()
	{
		try
		{
			while(listening)
			new Thread(new dialogserve(welcomeSocket.accept())).start();
		}
		catch(IOException ie)
		{
			ie.printStackTrace();
		}
	}
	public static void main(String args[])
	{
		new listenserve();
	}
}

