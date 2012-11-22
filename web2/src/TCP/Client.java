package TCP;

import java.io.*;
import java.net.Socket;
import java.lang.*;

public class Client
{
	
	private String sentence;
	private String modifiedSentence;
	
	
	public Client()
	{
		clientInit();
	}
	public void clientInit()
	{
		try
		{
			BufferedReader inFormUser = new BufferedReader(new InputStreamReader(System.in));			
			Socket clientSocket = new Socket("localhost", 6789);
			clientSocket.setSoTimeout(10000);
			
			DataOutputStream outToServer = new DataOutputStream(clientSocket.getOutputStream());
			BufferedReader inFormServer = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
			
			sentence = inFormUser.readLine();
			while(sentence.equals("end")!=true)
			{				
				outToServer.writeBytes(sentence + '\n');
				modifiedSentence = inFormServer.readLine();
				System.out.println("FROM SERVER:"+modifiedSentence);
				sentence = inFormUser.readLine();
			}
			
			sentence = new String("end");
			outToServer.writeBytes(sentence + '\n');
			modifiedSentence = inFormServer.readLine();
			clientSocket.close();
		}
		catch(IOException ie)
		{
			ie.toString();
		}
	}
	public static void main(String args[])
	{
		new Client();
	}
}

