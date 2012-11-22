package reliability_control;
import java.io.*;
import java.net.*;
import java.util.Timer;

/*UDP连接的Server实现可靠数据传输
 * 使用GBN算法，实现了：
 * 1.随即丢包(随机数产生器Math.random())
 * 2.丢包后遇冗余ack重传
 * 3.超时重传 (DatagramSocket和Socket都有成员函数setSoTimeout(delay),通过捕获超时时抛出的IO异常来实现超时重传)
 */

class UDPServer
{
	static int packetsize = 16;
	static int n = 10;	
	static byte [ ] receiveData = new byte [packetsize + 3];
	static byte [ ] sendData = new byte [packetsize + 3];    	
	static int listeningPort = 1500;
	static double p = 0.5;      // 随机指数
	static int delay = 1000;	// 延时   
	
    public static void main(String args [ ] )  throws Exception
    {    	
    	DatagramSocket serverSocket = new DatagramSocket (listeningPort); 	
    	int base = 1;
    	int nextseqnum = 1;
    	System.out.println("服务器的监听端口号是：" + listeningPort);    	
    	  	   	
    	FileReader f = new FileReader("D:/input.txt");
    	BufferedReader buffer = new BufferedReader(f);
    	String tempStr = buffer.readLine();

    	int size = tempStr.length();
    	double numpacket =Math.ceil((size*2)/packetsize)+1; // 服务器将向客户端发送的packet数
    	int length = (int)numpacket*packetsize;
    	byte bufferArray[] = new byte[length*2];
    	byte temp[] = tempStr.getBytes();
    	for(int s=0 ; s<length*2 ; s++)
    	{
    		if(s<temp.length)
    		{
    			bufferArray[s] = temp[s];
    		}
    		else
    		{
    			bufferArray[s] = ' ';
    		}   		
    	}
    	  	   	
      	System.out.println("文件已经读完，文件的大小是: " + size);
      	System.out.println("文件的内容是: " + tempStr);
      	
     	DatagramPacket receivePacket = new DatagramPacket ( receiveData , receiveData.length ); 	
      	serverSocket.receive (receivePacket);
      	String sentence = new String ( receivePacket.getData ( ) );
      	System.out.println("收到请求！！");
      	
      	InetAddress IPAddress = receivePacket.getAddress ( );
      	int port = receivePacket.getPort(); 
      	
    	serverSocket.setSoTimeout(delay);
      	int i;      	
      	System.out.println("开始传输文件内容！！");    		
      	byte buf1[] = new byte [packetsize];
      	byte buf2[] = new byte [packetsize];
      	//初始化buf1和buf2，即读入前两个包直接发送
      	for ( i = (nextseqnum - 1) * packetsize ; i < nextseqnum * packetsize; i++)
      	{
      			buf1[i] = bufferArray[i];
      	}
      	nextseqnum++;
      	String str = "1#" + new String (buf1);
      	System.out.println("发送数据包: " + str);
      	sendData = str.getBytes( );
      	DatagramPacket sendPacket = new DatagramPacket ( sendData, sendData.length ,IPAddress, port);
      	sendPacket(serverSocket, sendPacket );

      	int j;
      	for (j=0, i = (nextseqnum - 1) * packetsize; i < nextseqnum * packetsize; i++)
      	{
      		buf2[j++] = bufferArray[i];
      	}
      	nextseqnum++;
      	str = "2#" + new String (buf2);;
      	System.out.println(""); 
      	System.out.println("发送数据包:" + str);
      	sendData = str.getBytes( );
      	sendPacket = new DatagramPacket ( sendData, sendData.length ,IPAddress, port);     		
      	sendPacket(serverSocket, sendPacket );
 		     	
      	String strACKNum;
      	while ( true )
      	{ 
        	try
         	{        	  
	      		receivePacket = new DatagramPacket ( receiveData, receiveData.length );  
	      		serverSocket.receive (receivePacket );
	      		
	      		strACKNum = new String ( receivePacket.getData ( ) );
	      		System.out.println("");
	      		System.out.println("收到的 ACK 编号为: " + strACKNum.substring(0, strACKNum.indexOf('#') + 1));
	      		if (strACKNum.substring(0, strACKNum.indexOf('#')).equals(String.valueOf(base)))
	      		{// 接收到正确的Ack
	      			base++; 
	      			if (base == numpacket + 1)
	      			{// 已经发出n个包并且都收到确认Ack了
	      				break;
	      			}
	      			else if (base <= numpacket - 1)
	      			{// 收到Ack，继续发送后面的包，但是当base==n-1时，没有文件可发送了，只要等待最后窗口长度个Ack就行了
	      				buf1 = buf2;
	          			for (j = 0, i = (nextseqnum - 1) * packetsize ; i < nextseqnum * packetsize; i++)
	          			{
	          				buf2[j++] = bufferArray[i];
	          			}      		
	          	      	str = String.valueOf(nextseqnum) + "#" + new String (buf2); 
	          	      	System.out.println("");
	          	      	System.out.println("发送数据包: " + str);
	          	      	sendData = str.getBytes( );
	          			sendPacket = new DatagramPacket ( sendData, sendData.length ,IPAddress, port);
	          			sendPacket(serverSocket, sendPacket );
	          			nextseqnum++;      				
	      			}      			     			
	      		}       	
	      		else
	      		{// 冗余Ack, 重传
	      			System.out.println("");
	      			System.out.println("收到非期望的 Ack !");
	      			Resend(serverSocket, base, buf1, buf2, IPAddress, port,numpacket,bufferArray);	      			
	      		}      			     
         	}   
         	catch (IOException e)
         	{//  捕获超时抛出的异常，重传
         		System.out.println("");
         		System.out.println("超时了!");
         		Resend(serverSocket, base, buf1, buf2, IPAddress, port,numpacket,bufferArray);	  
         	} 
      	}	  
      	serverSocket.close();
      	System.out.println("完成文件的传输！！");     	
    }
    
	public static void sendPacket(DatagramSocket serverSocket, DatagramPacket packet)
	{
		try 
		{// 产生随机数控制丢包
			double i = Math.random();
			if (i > p)
			{
				serverSocket.send ( packet );			
			}			
			else
			{
				System.out.println("随机丢包!");
			}
		}
		catch (Exception e)
		{
			System.out.println("发送数据包出错，抛出异常!");						
		}
	}
    
    public static void Resend(DatagramSocket serverSocket, int base, byte[] buf1, byte[]buf2, 
    									InetAddress IPAddress, int port,double numpacket, byte[]bufferArray)
    {
    	byte temp[] = new byte [packetsize];
    	if (base < numpacket)
    	{   		
    		for(int s=0 ; s<packetsize ; s++)
    		{
    			temp[s]= bufferArray[(base-1)*packetsize+s];
    		}
	    	String str = String.valueOf(base) + "#" + new String(temp);
	    	System.out.println("重传数据包：" + str);
	    	sendData = str.getBytes( );
	    	DatagramPacket sendPack = new DatagramPacket ( sendData, sendData.length ,IPAddress, port);
	    	sendPacket(serverSocket, sendPack );
	    	for(int s=0 ; s<packetsize ; s++)
    		{
    			temp[s]= bufferArray[(base)*packetsize+s];
    		}
	    	str = String.valueOf(base + 1) + "#" + new String(temp);
	    	System.out.println("重传数据包：" + str);
	    	sendData = str.getBytes( );
	    	sendPack = new DatagramPacket ( sendData, sendData.length, IPAddress, port);
	    	sendPacket(serverSocket, sendPack );
	    }
    	else
    	{// 当只有最后一个包未确认时，重传也只要传最后一个包了
    		for(int s=0 ; s<packetsize ; s++)
    		{
    			temp[s]= bufferArray[(base)*packetsize+s];
    		}
	    	String str = String.valueOf(base) + "#" + new String(temp);
	    	System.out.println("重传数据包：" + str);
	    	sendData = str.getBytes( );
	    	DatagramPacket sendPack = new DatagramPacket ( sendData, sendData.length, IPAddress, port);
	    	sendPacket(serverSocket, sendPack );    		
    	}
    }
}




