package security;

import java.io.*;
import java.net.*;
class UDPClient
{
    public static void main( String args[ ] )  throws Exception
    {
    	int packetsize = 20;	
    	int expectednum = 1;	// �ͻ����ڴ���packet�����
    	int n = 10;	//	�ͻ��˽����յ�packet��
    	DatagramSocket clientSocket = new DatagramSocket ( );
    	InetAddress IPAddress = InetAddress.getByName ( "localhost" );
    	byte [ ] sendData =new byte [packetsize + 3];
    	byte [ ] receiveData =new byte [packetsize + 3];
    	
    	/*
    	BufferedReader inFromUser = new BufferedReader(new InputStreamReader(System.in));
    	String sentence = inFromUser.readLine();		// �Ӽ��̵ȴ�"request"����
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
        	   	sentence = String.valueOf(expectednum) + "#";
        	  // 	for (i = 0; )
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
}
