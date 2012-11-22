package security;

import java.io.*;
import java.net.*;
class UDPClient
{
    public static void main( String args[ ] )  throws Exception
    {
    	int packetsize = 20;	
    	int expectednum = 1;	// 客户端期待的packet的序号
    	int n = 10;	//	客户端将接收的packet数
    	DatagramSocket clientSocket = new DatagramSocket ( );
    	InetAddress IPAddress = InetAddress.getByName ( "localhost" );
    	byte [ ] sendData =new byte [packetsize + 3];
    	byte [ ] receiveData =new byte [packetsize + 3];
    	
    	/*
    	BufferedReader inFromUser = new BufferedReader(new InputStreamReader(System.in));
    	String sentence = inFromUser.readLine();		// 从键盘等待"request"命令
    	while (!sentence.equals("request"))
    	{
    		sentence = inFromUser.readLine();	        	    	
    	}*/
    	
    	String sentence = "request";
    	sendData = sentence.getBytes ( );    	
    	DatagramPacket sendPacket = new DatagramPacket ( sendData,sendData.length,IPAddress,1500 );
    	clientSocket.send ( sendPacket );
    	
    	/*
    	DatagramPacket receivePacket = new DatagramPacket ( receiveData,receiveData.length );
    	clientSocket.receive ( receivePacket );
    	String strRec = new String ( receivePacket.getData () );
    	String strLen = strRec.substring(0, strRec.indexOf('#'));
    	int filesize =  Integer.valueOf(strRec).intValue();  
    	System.out.println("file size:" + strLen);
    	*/
    	//byte fileCon[] = new byte[200];
    	//int i;
    	System.out.println("开始接受文件！！");    	
    	while (expectednum <= n)
    	{
    		DatagramPacket receivePacket = new DatagramPacket ( receiveData,receiveData.length );
        	clientSocket.receive ( receivePacket );
        	String strRec = new String (receivePacket.getData());
        	System.out.println ( "收到的packet: " + strRec );
        	String strNum = strRec.substring(0, strRec.indexOf('#'));
        	System.out.println ( "收到的packet序号为: " + strNum );
        	System.out.println ( "期待的序号为:" + expectednum );
        	if (strNum.equals(String.valueOf(expectednum)))
        	{
        		String packetCon = strRec.substring(strRec.indexOf('#') + 1);
        		System.out.println( "序号正确！包内容为：" +  packetCon);
        		// 发送确认信息给服务器
        	   	sentence = String.valueOf(expectednum) + "#";
        	  // 	for (i = 0; )
            	expectednum++;
        	}
        	else
        	{
        		System.out.println("失序！丢弃该包并发送冗余Ack");
        		// 发送冗余Ack
        	   	sentence = String.valueOf(expectednum - 1) + "#";
        	}
        	System.out.println("发送 ACK: " + sentence);
        	System.out.println("");
        	sendData = sentence.getBytes ( );
        	sendPacket = new DatagramPacket ( sendData,sendData.length,IPAddress,1500 );
        	clientSocket.send ( sendPacket );   	                 	
    	}
    	System.out.println("完成文件传输！！"); 
    	clientSocket.close ( );
    }
}
