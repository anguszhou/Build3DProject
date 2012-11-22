package UDP;

import java.net.*;

public class Server
{
	private DatagramSocket ser;
	private DatagramPacket pac;
	private byte rb[];
	private String rev;
	
	public Server()
	{
		Init();
	}
	public void Init()
	{
		try
		{
			ser=new DatagramSocket(10015);
			rb=new byte[1024];
			pac=new DatagramPacket(rb,rb.length);
			rev="";
			int i=0;
			
			while(i==0)
			//无数据，则循环
			{
				ser.receive(pac);
				i=pac.getLength();
				//接收数据
				if(i>0)
				{
					//指定接收到数据的长度,
					//可使接收数据正常显示,开始时很轻易忽略这一点
					rev=new String(rb,0,pac.getLength());
					System.out.println(rev);
					i=0;//循环接收
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void main(String args[])
	{
		new Server();
	}
}

