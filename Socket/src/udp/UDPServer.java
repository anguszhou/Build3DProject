package udp;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

public class UDPServer
{
	public int port = 8821;

	public void start()
	{
		DatagramSocket serverSocket = null;
		try
		{
			serverSocket = new DatagramSocket(port);
			byte[] receiveData = new byte[1024];
			while (true)
			{
				DatagramPacket receivePacket = new DatagramPacket(receiveData, 
						receiveData.length);
				serverSocket.receive(receivePacket);
				String fileName = new String(receivePacket.getData());
				System.out.println("fileName: " + fileName);
				InetAddress ipAddress = receivePacket.getAddress();
				int serverPort = receivePacket.getPort();
				//选择进行发送的文件
				File fi = new File(fileName);
			//	System.out.println("read from client: " + fileName);
				System.out.println("文件长度:" + (int) fi.length());
				int bufferSize = 10240;//(int) fi.length();
				byte[] sendData = new byte[bufferSize];
				long start = System.currentTimeMillis();
				
				// 读取文件，发送到客户端
				DataInputStream fis = new DataInputStream(
						new BufferedInputStream(new FileInputStream(fileName)));
				
				int read = fis.read(sendData);
			//	System.out.println(new String(sendData));
				System.out.println("read:" + read);
				while (read != -1)
				{
					serverSocket.send(new DatagramPacket(sendData, sendData.length, ipAddress, serverPort));
					sendData = new byte[bufferSize];
					read = fis.read(sendData);
					//System.out.println("String : ");
				//	System.out.println(new String(sendData));
				//	System.out.println("read: " + read);
					Thread.sleep(20);
				}
				byte[] end = new byte[10240];
				// 传输结束
				serverSocket.send(new DatagramPacket(end, end.length, ipAddress, serverPort));
				Thread.sleep(20);
				
				long finish = System.currentTimeMillis();
				fis.close();
			//	serverSocket.close();
				System.out.println("文件传输完成。发送耗时： " + (finish - start) + " ms.");
				
			}
		} 
		catch (SocketException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
		
	}

	public static void main(String arg[])
	{
		UDPServer server = new UDPServer();
		server.start();
	}
}
