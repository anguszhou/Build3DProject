package UDP;

import java.net.*;

public class Server
{
	
	public static void main(String[] args) throws Exception
	{
	   DatagramSocket serverSocket = new DatagramSocket(8900);
	   byte[] sendData    = new byte[1024];
	   byte[] receiveData = new byte[1024];
	   
	   if(true)
	   {
		   DatagramPacket receivePacket = new DatagramPacket(receiveData,receiveData.length);
		   System.out.println("receive.");
		   try
		{
			serverSocket.receive(receivePacket);
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   System.out.println("receivePacket: " + new String(receiveData));
		   String sentence = new String(receivePacket.getData());
		   InetAddress IPAddress = receivePacket.getAddress();
		   int port = receivePacket.getPort();
		   
		   String capitalizedSentence = sentence.toUpperCase();
		   sendData = capitalizedSentence.getBytes();
		   DatagramPacket sendPacket = new DatagramPacket(sendData,sendData.length,IPAddress,port);
		   serverSocket.send(sendPacket);
	   }
	}
	
}
