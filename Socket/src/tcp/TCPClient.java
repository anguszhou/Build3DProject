package tcp;

import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileOutputStream;

public class TCPClient
{
	private TCPClientSocket cs = null;

	private String ip = "localhost";// 设置成服务器IP

	private int port = 8821;
	
	private String fileName = "d:\\a.bmp";

	public void start()
	{
		try
		{
			if (createConnection())
			{
				sendMessage();
				getMessage();
			}

		} catch (Exception ex)
		{
			ex.printStackTrace();
		}
	}

	private boolean createConnection()
	{
		cs = new TCPClientSocket(ip, port);
		try
		{
			cs.CreateConnection();
			System.out.print("连接服务器成功!");
			return true;
		}
		catch (Exception e)
		{
			System.out.print("连接服务器失败!");
			return false;
		}

	}

	private void sendMessage()
	{
		if (cs == null)
			return;
		try
		{
			cs.sendMessage(fileName);
		} 
		catch (Exception e)
		{
			System.out.print("发送消息失败!" + "\n");
		}
	}

	private void getMessage()
	{
		if (cs == null)
			return;
		DataInputStream inputStream = null;
		try
		{
			inputStream = cs.getMessageStream();
		} 
		catch (Exception e)
		{
			System.out.print("接收消息缓存错误\n");
			e.printStackTrace();
			return;
		}

		try
		{
			// 本地保存路径，文件名会从服务器端传来。
			String savePath = "E:\\";
			int bufferSize = 10000;
			byte[] buf = new byte[bufferSize];
	//		int passedlen = 0;
			long len = 0;
			
			//保存文件
			savePath += inputStream.readUTF();
			DataOutputStream fileOut = new DataOutputStream(
					new BufferedOutputStream(new BufferedOutputStream(
							new FileOutputStream(savePath))));
			len = inputStream.readLong();

			System.out.println("文件的长度为:" + len);
			long start = System.currentTimeMillis();
			System.out.println("开始接收文件...");

			while (true)
			{
				int read = 0;
				if (inputStream != null)
				{
					read = inputStream.read(buf);
				}
		//		passedlen += read;
				if (read == -1)
				{
					break;
				}
				// 下面进度条本为图形界面的prograssBar做的，这里如果是打文件，可能会重复打印出一些相同的百分比
		//		System.out.println("文件接收了" + (passedlen * 100 / len) + "%\n");
				fileOut.write(buf, 0, read);
			}
			long finish = System.currentTimeMillis();
			System.out.println("文件传输完成。接受耗时： " + (finish - start) + " ms. 文件存为： " + savePath);
			fileOut.close();
		}
		catch (Exception e)
		{
			System.out.println("接收消息错误.");
			e.printStackTrace();
			return;
		}
	}

	public static void main(String arg[])
	{
		TCPClient client = new TCPClient();
		client.start();
	}
}