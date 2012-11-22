package security;
import java.io.*;
import java.net.*;
import java.util.Timer;


/*UDP���ӵ�Serverʵ�ֿɿ����ݴ���
 * ʹ��GBN�㷨��ʵ���ˣ�
 * 1.�漴����(�����������Math.random())
 * 2.������������ack�ش�
 * 3.��ʱ�ش� (DatagramSocket��Socket���г�Ա����setSoTimeout(delay),ͨ������ʱʱ�׳���IO�쳣��ʵ�ֳ�ʱ�ش�)
 */

class UDPServer
{
	static int packetsize = 20;
	static int n = 10;	// ����������ͻ��˷��͵�packet��
	static byte [ ] receiveData = new byte [packetsize + 3];
	static byte [ ] sendData = new byte [packetsize + 3];    	
	static int listeningPort = 1500;
	static double p = 0.5; // probability of dropping packets
	static int delay = 2000;	// ��ʱ   
	
    public static void main(String args [ ] )  throws Exception
    {    	
    	DatagramSocket serverSocket = new DatagramSocket (listeningPort); 	
    	int base = 1;
    	int nextseqnum = 1;
    	System.out.println("�������ļ����˿ں��ǣ�" + listeningPort);    	
    	  	   	
    	FileReader f = new FileReader("E:/1.txt");
    	BufferedReader buffer = new BufferedReader(f);
    	String tempStr = buffer.readLine();

    	int size = tempStr.length();
    	byte bufferArray[] = new byte[size+100];
    	bufferArray = tempStr.getBytes();    	 
    	
    	/*
    	File f = new File("D:/lxk.txt");
    	int length = (int)f.length();  //�ļ����
		byte[] buf;
		buf = new byte[length]; //֮����Ҫ+1������Ϊ��һ��byte�������洢�İ��ı�ŵ�
		FileInputStream from = null;
		from = new FileInputStream(f);
		int bytes_read = 0, n;
		 do{
			 n = from.read(buf, bytes_read, length - bytes_read);
			 bytes_read += n;
		 }while((bytes_read < length)&& (n!=-1));
		 */		
    	/*
    	int temp;
      	while ((temp = buffer.read(bufferArray, 0, size))!= -1)
    	{
      		System.out.println(n);
      	} 
      	*/  	
      	System.out.println("�ļ��Ѿ����꣬�ļ��Ĵ�С��: " + size);
      	System.out.println("�ļ���������: " + tempStr);
      	
     	DatagramPacket receivePacket = new DatagramPacket ( receiveData , receiveData.length ); 	
      	serverSocket.receive (receivePacket);
      	String sentence = new String ( receivePacket.getData ( ) );
      	System.out.println("�յ����󣡣�");
      	
      	InetAddress IPAddress = receivePacket.getAddress ( );
      	int port = receivePacket.getPort(); 
      	
      	/*
      	// ��ͻ��˷��ͱ��ģ���֪�ļ���С
      	String str = String.valueOf(size) + "#";
      	byte filesize[] = new byte[8];
      	filesize = str.getBytes();
      	DatagramPacket sendPacket = new DatagramPacket ( filesize, filesize.length ,IPAddress, port);
      	sendPacket(p, serverSocket, sendPacket );
      	*/
 
    	serverSocket.setSoTimeout(delay);
      	int i;      	
      	System.out.println("��ʼ�����ļ����ݣ���");    		
      	byte buf1[] = new byte [packetsize];
      	byte buf2[] = new byte [packetsize];
      	//��ʼ��buf1��buf2��������ǰ������ֱ�ӷ���
      	for ( i = (nextseqnum - 1) * packetsize ; i < nextseqnum * packetsize; i++)
      	{
      			buf1[i] = bufferArray[i];
      	}
      	nextseqnum++;
      	String str = "1#" + new String (buf1);
      	System.out.println("�������ݰ�: " + str);
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
      	System.out.println("�������ݰ�:" + str);
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
	      		System.out.println("�յ��� ACK ���Ϊ: " + strACKNum.substring(0, strACKNum.indexOf('#') + 1));
	      		if (strACKNum.substring(0, strACKNum.indexOf('#')).equals(String.valueOf(base)))
	      		{// ���յ���ȷ��Ack
	      			base++; 
	      			if (base == n + 1)
	      			{// �Ѿ�����n�������Ҷ��յ�ȷ��Ack��
	      				break;
	      			}
	      			else if (base <= n - 1)
	      			{// �յ�Ack���������ͺ���İ������ǵ�base==n-1ʱ��û���ļ��ɷ����ˣ�ֻҪ�ȴ���󴰿ڳ��ȸ�Ack������
	      				buf1 = buf2;
	          			for (j = 0, i = (nextseqnum - 1) * packetsize ; i < nextseqnum * packetsize; i++)
	          			{
	          				buf2[j++] = bufferArray[i];
	          			}      		
	          	      	str = String.valueOf(nextseqnum) + "#" + new String (buf2); 
	          	      	System.out.println("");
	          	      	System.out.println("�������ݰ�: " + str);
	          	      	sendData = str.getBytes( );
	          			sendPacket = new DatagramPacket ( sendData, sendData.length ,IPAddress, port);
	          			sendPacket(serverSocket, sendPacket );
	          			nextseqnum++;      				
	      			}      			     			
	      		}       	
	      		else
	      		{// ����Ack, �ش�
	      			System.out.println("");
	      			System.out.println("�յ��������� Ack !");
	      			Resend(serverSocket, base, buf1, buf2, IPAddress, port);	      			
	      		}      			     
         	}   
         	catch (IOException e)
         	{//  ����ʱ�׳����쳣���ش�
         		System.out.println("");
         		System.out.println("��ʱ��!");
         		Resend(serverSocket, base, buf1, buf2, IPAddress, port);	  
         	} 
      	}	  
      	serverSocket.close();
      	System.out.println("����ļ��Ĵ��䣡��");     	
    }
    
	public static void sendPacket(DatagramSocket serverSocket, DatagramPacket packet)
	{
		try 
		{// randomly dropping packet
			double i = Math.random();
			if (i > p)
			{
				serverSocket.send ( packet );			
			}			
			else
			{
				System.out.println("�������!");
				//System.out.println( "packet  content:" + new String(packet.getData()) );
			}
		}
		catch (Exception e)
		{
			System.out.println("sending packet failed! throws exception");						
		}
	}
    
    public static void Resend(DatagramSocket serverSocket, int base, byte[] buf1, byte[]buf2, 
    									InetAddress IPAddress, int port)
    {
    	if (base < n)
    	{
	    	String str = String.valueOf(base) + "#" + new String(buf1);
	    	System.out.println("�ش����ݰ���" + str);
	    	sendData = str.getBytes( );
	    	DatagramPacket sendPack = new DatagramPacket ( sendData, sendData.length ,IPAddress, port);
	    	sendPacket(serverSocket, sendPack );
	    	str = String.valueOf(base + 1) + "#" + new String(buf2);
	    	System.out.println("�ش����ݰ���" + str);
	    	sendData = str.getBytes( );
	    	sendPack = new DatagramPacket ( sendData, sendData.length, IPAddress, port);
	    	sendPacket(serverSocket, sendPack );
	    }
    	else
    	{// ��ֻ�����һ����δȷ��ʱ���ش�ҲֻҪ�����һ������
	    	String str = String.valueOf(base) + "#" + new String(buf2);
	    	System.out.println("�ش����ݰ���" + str);
	    	sendData = str.getBytes( );
	    	DatagramPacket sendPack = new DatagramPacket ( sendData, sendData.length, IPAddress, port);
	    	sendPacket(serverSocket, sendPack );    		
    	}
    }
}




