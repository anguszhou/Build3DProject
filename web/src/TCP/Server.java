package TCP;

import java.io.*;
import java.net.*;

public class Server
{
	
	public static void main(String[] args) throws Exception
	{
	   String clientSentence;
	   String capitalizedSentence;
	   ServerSocket welcomeSocket = new ServerSocket(6789);
	   
	   while(true)
	   {
		   Socket connectionSocket = welcomeSocket.accept();
		   BufferedReader inFormClient = new BufferedReader
		     (new InputStreamReader(connectionSocket.getInputStream()));
		   DataOutputStream outToClient = new DataOutputStream(connectionSocket.getOutputStream());
		   clientSentence = inFormClient.readLine();
		   capitalizedSentence = clientSentence.toUpperCase()+'\n';
		   outToClient.writeBytes(capitalizedSentence);
	   }
	}
	
}
