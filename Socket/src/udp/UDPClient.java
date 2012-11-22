package udp;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class UDPClient
{
	
	private String ip = "localhost";// ���óɷ�����IP

	private int port = 8821;

	private String fileName = "d:\\a.bmp";

	public void start()
	{
		try
		{
			DatagramSocket clientSocket = new DatagramSocket();
			InetAddress ipAddress = InetAddress.getByName(ip);
			
			byte[] sendData = fileName.getBytes();
		//	System.out.println(sendData.length);
			int bufferSize = 10240;
			byte[] receiveData = new byte[bufferSize];
			String savePath = "E:\\a.bmp";

			//�������͵����ݰ�
			DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length,
					ipAddress, port);
			//�������ݡ�UDP����һ��������������ַ�ķ��飬���䷢��
			clientSocket.send(sendPacket);
			int begin = 0, len;
			long start = 0;
			byte[] end = new byte[10240];
			String endTag = new String(end);
			File file = new File(savePath);
			file.delete();
			file.createNewFile();
			file.canWrite();
			DataOutputStream fileOut = new DataOutputStream(
					new BufferedOutputStream(new BufferedOutputStream(
							new FileOutputStream(savePath))));

			//�ڵȴ����Է������ķ���ʱ���ͻ��������˷��÷���ĵط�����receivePacket����
			DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
			while (true)
			{
			//	System.out.println("��ʼ���յ�" + begin + "���ְ�...");
				
				//���ܷ��飬���ŵ�recievePacket��
				clientSocket.receive(receivePacket);
		//		System.out.println("��" + begin + "���ְ�������ɡ�");
				if (begin == 0)
				{
					start = System.currentTimeMillis();
				}
				begin ++;
			//	System.out.println(begin);
				//System.out.println(end.equals(receivePacket.getData()));
				String str = new String(receivePacket.getData());
				if (str.endsWith(endTag))
				{
					long finish = System.currentTimeMillis();
					System.out.println("�ļ�������ɡ����ܺ�ʱ�� " + (finish - start) + " ms. �ļ���Ϊ�� " + savePath);
					fileOut.close();
					break;
				}
				/*int index = str.indexOf('\0');
				String strFile = str.substring(0, index);
				byte[] buf = strFile.getBytes();*/
				//�����ļ�
				//System.out.println("�ļ��ĳ���Ϊ:" + len);
				fileOut.write(receiveData, 0, receiveData.length);
				/*long finish = System.currentTimeMillis();
				System.out.println("�ļ�������ɡ����ܺ�ʱ�� " + (finish - start) + " ms. �ļ���Ϊ�� " + savePath);*/
				//fileOut.close();
			}
			
		}
		catch (Exception e)
		{
			System.out.println("�����ļ�����.");
			e.printStackTrace();
		}	
	}

	public static void main(String arg[])
	{
		UDPClient client = new UDPClient();
		client.start();
	}
}