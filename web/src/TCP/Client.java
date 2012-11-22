package TCP;

import java.io.*;
import java.net.*;

public class Client
{
	
	public static void main(String[] args) throws Exception
	{
		String sentence;
		String modifiedSentence;
		
		BufferedReader inFormUser = new BufferedReader(new InputStreamReader(System.in));
		Socket clientSocket = new Socket("localhost", 6789);
		DataOutputStream outToServer = new DataOutputStream(clientSocket.getOutputStream());
		BufferedReader inFormServer = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
		
		sentence = inFormUser.readLine();
		outToServer.writeBytes(sentence + '\n');
		modifiedSentence = inFormServer.readLine();
		System.out.println("FROM SERVER:"+modifiedSentence);
		
		clientSocket.close();
	}
	
}
