package reliability_control;
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
	static int packetsize = 16;
	static int n = 10;	
	static byte [ ] receiveData = new byte [packetsize + 3];
	static byte [ ] sendData = new byte [packetsize + 3];    	
	static int listeningPort = 1500;
	static double p = 0.5;      // ���ָ��
	static int delay = 1000;	// ��ʱ   
	
    public static void main(String args [ ] )  throws Exception
    {    	
    	DatagramSocket serverSocket = new DatagramSocket (listeningPort); 	
    	int base = 1;
    	int nextseqnum = 1;
    	System.out.println("�������ļ����˿ں��ǣ�" + listeningPort);    	
    	  	   	
    	FileReader f = new FileReader("E:/input.txt");
    	BufferedReader buffer = new BufferedReader(f);
    	String tempStr = buffer.readLine();

    	int size = tempStr.length();
    	double numpacket =Math.ceil((size*2)/packetsize)+1; // ����������ͻ��˷��͵�packet��
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
    	  	   	
      	System.out.println("�ļ��Ѿ����꣬�ļ��Ĵ�С��: " + size);
      	System.out.println("�ļ���������: " + tempStr);
      	
     	DatagramPacket receivePacket = new DatagramPacket ( receiveData , receiveData.length ); 	
      	serverSocket.receive (receivePacket);
      	String sentence = new String ( receivePacket.getData ( ) );
      	System.out.println("�յ����󣡣�");
      	
      	InetAddress IPAddress = receivePacket.getAddress ( );
      	int port = receivePacket.getPort(); 
      	
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
	      			if (base == numpacket + 1)
	      			{// �Ѿ�����n�������Ҷ��յ�ȷ��Ack��
	      				break;
	      			}
	      			else if (base <= numpacket - 1)
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
	      			Resend(serverSocket, base, buf1, buf2, IPAddress, port,numpacket,bufferArray);	      			
	      		}      			     
         	}   
         	catch (IOException e)
         	{//  ����ʱ�׳����쳣���ش�
         		System.out.println("");
         		System.out.println("��ʱ��!");
         		Resend(serverSocket, base, buf1, buf2, IPAddress, port,numpacket,bufferArray);	  
         	} 
      	}	  
      	serverSocket.close();
      	System.out.println("����ļ��Ĵ��䣡��");     	
    }
    
	public static void sendPacket(DatagramSocket serverSocket, DatagramPacket packet)
	{
		try 
		{// ������������ƶ���
			double i = Math.random();
			if (i > p)
			{
				serverSocket.send ( packet );			
			}			
			else
			{
				System.out.println("�������!");
			}
		}
		catch (Exception e)
		{
			System.out.println("�������ݰ������׳��쳣!");						
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
	    	System.out.println("�ش����ݰ���" + str);
	    	sendData = str.getBytes( );
	    	DatagramPacket sendPack = new DatagramPacket ( sendData, sendData.length ,IPAddress, port);
	    	sendPacket(serverSocket, sendPack );
	    	for(int s=0 ; s<packetsize ; s++)
    		{
    			temp[s]= bufferArray[(base)*packetsize+s];
    		}
	    	str = String.valueOf(base + 1) + "#" + new String(temp);
	    	System.out.println("�ش����ݰ���" + str);
	    	sendData = str.getBytes( );
	    	sendPack = new DatagramPacket ( sendData, sendData.length, IPAddress, port);
	    	sendPacket(serverSocket, sendPack );
	    }
    	else
    	{// ��ֻ�����һ����δȷ��ʱ���ش�ҲֻҪ�����һ������
    		for(int s=0 ; s<packetsize ; s++)
    		{
    			temp[s]= bufferArray[(base)*packetsize+s];
    		}
	    	String str = String.valueOf(base) + "#" + new String(temp);
	    	System.out.println("�ش����ݰ���" + str);
	    	sendData = str.getBytes( );
	    	DatagramPacket sendPack = new DatagramPacket ( sendData, sendData.length, IPAddress, port);
	    	sendPacket(serverSocket, sendPack );    		
    	}
    }
}




