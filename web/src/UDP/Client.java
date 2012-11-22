package UDP;

import java.io.*;
import java.net.*;

public class Client
{
	
	public static void main(String[] args) throws Exception
	{
	//	BufferedReader inFormUser = new BufferedReader(new InputStreamReader(System.in));
		DatagramSocket clientSocket = new DatagramSocket();
		InetAddress IPAddress = InetAddress.getByName("localhost");
		
		byte[] sendData    = new byte[1024];
		byte[] receiveData = new byte[1024];
		//if()
	//	String sentence = inFormUser.readLine();
	//	sendData = sentence.getBytes();
		String sentence = "end";
		sendData = sentence.getBytes();
		System.out.println("sendData: " + new String(sendData));
		DatagramPacket sendPacket = new DatagramPacket(sendData,sendData.length,IPAddress,8900);
		clientSocket.send(sendPacket);
		System.out.println("send.");
		DatagramPacket receivePacket = new DatagramPacket(receiveData,receiveData.length);
		clientSocket.receive(receivePacket);
		String modifiedSentence = new String (receivePacket.getData());
		
		System.out.println("FORM SERVER:"+modifiedSentence);
		clientSocket.close();
	}
	
}
