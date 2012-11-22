package reliability_control;

import java.io.*;
import java.net.*;
class UDPClient
{
    public static void main( String args[ ] )  throws Exception
    {
    	int packetsize = 16;	
    	int expectednum = 1;	// 客户端期待的packet的序号
    	int n = 100;	//	客户端将接收的packet数
    	DatagramSocket clientSocket = new DatagramSocket ( );
    	InetAddress IPAddress = InetAddress.getByName ( "localhost" );
    	byte [ ] sendData =new byte [packetsize + 3];
    	byte [ ] receiveData =new byte [packetsize + 3];
    	    	    	
    	String sentence = "request";
    	sendData = sentence.getBytes ( );    	
    	DatagramPacket sendPacket = new DatagramPacket ( sendData,sendData.length,IPAddress,1500 );
    	clientSocket.send ( sendPacket );
    	
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
        		Output(packetCon); 
        		//将收到的数据包写到文件中
        	   	sentence = String.valueOf(expectednum) + "#";
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
    
    static void Output(String packetCon)
    //将收到的数据包写到文件中
    {
    	String s = new String();
        String s1 = new String();
        try {
	         File f = new File("D:\\output.txt");
	         if (f.exists()) 
	         {
	        	System.out.println("");
	          	//System.out.println("文件存在");
	         } 
	         else 
	         {
		          System.out.println("文件不存在，正在创建...");
		          if (f.createNewFile()) 
		          {
		        	  System.out.println("文件创建成功！");
		          }
		          else 
		          {
		        	  System.out.println("文件创建失败！");
		          }
	         }
	         BufferedReader input = new BufferedReader(new FileReader(f));
	         while ((s = input.readLine()) != null) 
	         {
	        	 s1 += s + "\r\n";
	         }
	         System.out.println("文件内容：");
	         System.out.println(s1);
	         input.close();
	         s1 += packetCon;
	
	         BufferedWriter output = new BufferedWriter(new FileWriter(f));
	         output.write(s1);
	         output.close();
        	} catch (Exception e) 
        	{
        		e.printStackTrace();
        	}
    }
}

