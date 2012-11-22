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
			//�����ݣ���ѭ��
			{
				ser.receive(pac);
				i=pac.getLength();
				//��������
				if(i>0)
				{
					//ָ�����յ����ݵĳ���,
					//��ʹ��������������ʾ,��ʼʱ�����׺�����һ��
					rev=new String(rb,0,pac.getLength());
					System.out.println(rev);
					i=0;//ѭ������
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

