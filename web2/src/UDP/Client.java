package UDP;

import java.io.*;
import java.net.*;

public class Client
{
	private DatagramSocket cli;
	private DatagramPacket pac;
	private byte sb[];
	private String sen;
	
	public Client()
	{
		Init();
	}
	public void Init()
	{
		try
		{
			//指定端口号，避免与其他应用程序发生冲突
			cli=new DatagramSocket();
			sb=new byte[1024];
			sen="UDP方式发送数据";
			sb=sen.getBytes();
			pac=new DatagramPacket(sb,sb.length,
					InetAddress.getByName("localhost"),10015);
			cli.send(pac);
		}
		catch(SocketException se)
		{
			se.printStackTrace();
		}
		catch(IOException ie)
		{
			ie.printStackTrace();
		}
	}
	public static void main(String args[])
	{
		new Client();
	}
}
