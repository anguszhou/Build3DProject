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
	
	private String ip = "localhost";// 设置成服务器IP

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

			//建立发送的数据包
			DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length,
					ipAddress, port);
			//发送数据。UDP创建一个包含服务器地址的分组，将其发送
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

			//在等待来自服务器的分组时，客户机创建了放置分组的地方，即receivePacket对象
			DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
			while (true)
			{
			//	System.out.println("开始接收第" + begin + "个分包...");
				
				//接受分组，并放到recievePacket中
				clientSocket.receive(receivePacket);
		//		System.out.println("第" + begin + "个分包接受完成。");
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
					System.out.println("文件传输完成。接受耗时： " + (finish - start) + " ms. 文件存为： " + savePath);
					fileOut.close();
					break;
				}
				/*int index = str.indexOf('\0');
				String strFile = str.substring(0, index);
				byte[] buf = strFile.getBytes();*/
				//接受文件
				//System.out.println("文件的长度为:" + len);
				fileOut.write(receiveData, 0, receiveData.length);
				/*long finish = System.currentTimeMillis();
				System.out.println("文件传输完成。接受耗时： " + (finish - start) + " ms. 文件存为： " + savePath);*/
				//fileOut.close();
			}
			
		}
		catch (Exception e)
		{
			System.out.println("接收文件错误.");
			e.printStackTrace();
		}	
	}

	public static void main(String arg[])
	{
		UDPClient client = new UDPClient();
		client.start();
	}
}