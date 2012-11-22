package TCP;

import java.io.*;
import java.net.ServerSocket;

//主程序一直处于监听状态，有连接则启动一个线程进行处理，以实现多个客户端
public class listenserve
{
	private ServerSocket welcomeSocket;
	private boolean listening=true;
	
	public listenserve()
	{
		Init();//初始化
		lisn();//启动监听 
	}
	public void Init()
	{
		try
		{
			welcomeSocket=new ServerSocket(6789,10);
		}
		catch(IOException ie)
		{
			System.out.println("无法在6789端口监听");
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

