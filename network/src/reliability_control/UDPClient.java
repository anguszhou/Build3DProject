package reliability_control;

import java.io.*;
import java.net.*;
class UDPClient
{
    public static void main( String args[ ] )  throws Exception
    {
    	int packetsize = 16;	
    	int expectednum = 1;	// �ͻ����ڴ���packet�����
    	int n = 100;	//	�ͻ��˽����յ�packet��
    	DatagramSocket clientSocket = new DatagramSocket ( );
    	InetAddress IPAddress = InetAddress.getByName ( "localhost" );
    	byte [ ] sendData =new byte [packetsize + 3];
    	byte [ ] receiveData =new byte [packetsize + 3];
    	    	    	
    	String sentence = "request";
    	sendData = sentence.getBytes ( );    	
    	DatagramPacket sendPacket = new DatagramPacket ( sendData,sendData.length,IPAddress,1500 );
    	clientSocket.send ( sendPacket );
    	
    	System.out.println("��ʼ�����ļ�����");    	
    	while (expectednum <= n)
    	{
    		DatagramPacket receivePacket = new DatagramPacket ( receiveData,receiveData.length );
        	clientSocket.receive ( receivePacket );
        	String strRec = new String (receivePacket.getData());
        	System.out.println ( "�յ���packet: " + strRec );
        	String strNum = strRec.substring(0, strRec.indexOf('#'));
        	System.out.println ( "�յ���packet���Ϊ: " + strNum );
        	System.out.println ( "�ڴ������Ϊ:" + expectednum );
        	if (strNum.equals(String.valueOf(expectednum)))
        	{
        		String packetCon = strRec.substring(strRec.indexOf('#') + 1);
        		System.out.println( "�����ȷ��������Ϊ��" +  packetCon);
        		// ����ȷ����Ϣ��������
        		Output(packetCon); 
        		//���յ������ݰ�д���ļ���
        	   	sentence = String.valueOf(expectednum) + "#";
            	expectednum++;
        	}
        	else
        	{
        		System.out.println("ʧ�򣡶����ð�����������Ack");
        		// ��������Ack
        	   	sentence = String.valueOf(expectednum - 1) + "#";
        	}
        	System.out.println("���� ACK: " + sentence);
        	System.out.println("");
        	sendData = sentence.getBytes ( );
        	sendPacket = new DatagramPacket ( sendData,sendData.length,IPAddress,1500 );
        	clientSocket.send ( sendPacket );   	                 	
    	}
    	System.out.println("����ļ����䣡��"); 
    	clientSocket.close ( );
    }
    
    static void Output(String packetCon)
    //���յ������ݰ�д���ļ���
    {
    	String s = new String();
        String s1 = new String();
        try {
	         File f = new File("D:\\output.txt");
	         if (f.exists()) 
	         {
	        	System.out.println("");
	          	//System.out.println("�ļ�����");
	         } 
	         else 
	         {
		          System.out.println("�ļ������ڣ����ڴ���...");
		          if (f.createNewFile()) 
		          {
		        	  System.out.println("�ļ������ɹ���");
		          }
		          else 
		          {
		        	  System.out.println("�ļ�����ʧ�ܣ�");
		          }
	         }
	         BufferedReader input = new BufferedReader(new FileReader(f));
	         while ((s = input.readLine()) != null) 
	         {
	        	 s1 += s + "\r\n";
	         }
	         System.out.println("�ļ����ݣ�");
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

