package Server;

import java.io.*;   
import java.net.*;   
import java.util.*;   
   
public class browser   
{   
  public static void main(String args[])   
  {   
         try{   
           System.out.println("begin now!");   
           ServerSocket mlistenSocket = new ServerSocket(6789);   
           Socket mconnectionSocket ;   
          while(true){   
             mconnectionSocket = mlistenSocket.accept();   
             WS ws = new WS(mlistenSocket, mconnectionSocket);   
             Thread t = new Thread(ws);   
             t.start();   
           }   
         }catch(Exception e){   
         System.exit(1);   
       }   
   
  }   
}   
   
class WS  implements Runnable   
{   
   
  private ServerSocket listenSocket ;   
  private Socket connectionSocket ;   
  WS(ServerSocket mlistenSocket,Socket mconnectionSocket)   
  {   
    listenSocket=mlistenSocket;   
    connectionSocket=mconnectionSocket;   
  }   
  public void run()   
  {   
    try{   
       String requestMessageLine;   
       String fileName;   
      BufferedReader inFromClient = new BufferedReader( new InputStreamReader( connectionSocket.getInputStream() ) );   
      DataOutputStream outToClient = new DataOutputStream( connectionSocket.getOutputStream() );   
      requestMessageLine = inFromClient.readLine();   
      StringTokenizer tokenizedLine = new StringTokenizer(requestMessageLine);   
      if(tokenizedLine.nextToken().equals("GET") )   
      {   
   
        fileName = tokenizedLine.nextToken();   
        if(fileName.startsWith("/") == true)   
          fileName = fileName.substring(1);   
        File file = new File(fileName);   
        int numOfBytes = (int) file.length();   
        FileInputStream inFile = new FileInputStream(fileName);   
        byte[] fileInBytes = new byte[numOfBytes];   
        inFile.read(fileInBytes);   
        outToClient.writeBytes("HTTP/1.0 200 Document Follows\r\n");   
        if(fileName.endsWith(".jpg"))   
          outToClient.writeBytes("Content-Type:image/jpeg\r\n");   
        if(fileName.endsWith(".gif"))   
          outToClient.writeBytes("Content-Type:image/gif\r\n");   
        outToClient.writeBytes("Content-Length: " + numOfBytes + "\r\n");   
        outToClient.writeBytes("\r\n");   
        outToClient.write(fileInBytes,0,numOfBytes);   
        connectionSocket.close();   
        System.out.println("finish!");   
      }   
      else System.out.println("Bad Request Message");   
  }catch(Exception e){   
  System.exit(1);   
}   
   
   
}   
}  
