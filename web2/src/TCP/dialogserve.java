package TCP;

import java.io.*;
import java.net.Socket;
import java.net.SocketException;

public class dialogserve implements Runnable
{
	private Socket connectionSocket;
	private InputStream in;
		
	String clientSentence;
	String capitalizedSentence;
	
	
	public dialogserve(Socket connection)
	{
		this.connectionSocket=connection;		
	}
	public void run()
	{
		try
		{
			while(connectionSocket.isConnected()==true)
			{
				
			   BufferedReader inFormClient = new BufferedReader
			     	(new InputStreamReader(connectionSocket.getInputStream()));
			   DataOutputStream outToClient = new DataOutputStream(connectionSocket.getOutputStream());
			   clientSentence = inFormClient.readLine();
			   if(clientSentence.equals("end")!=true)
			   {
				   capitalizedSentence = clientSentence.toUpperCase()+'\n';
				   outToClient.writeBytes(capitalizedSentence);
			   }
			   else 
               {
				   System.out.println("会话socket已断开！");
				   /*in.close();
				   connectionSocket.close();	*/			   
               }               
			} 			
		}
		catch(SocketException se)
		{
			System.out.println("客户端已断开！");
			System.exit(0);
		}
		catch(IOException io)
		{
			io.printStackTrace();
			System.exit(0);
		}
		
	}
}
