package tcp;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class TCPServer
{
	public int port = 8821;

	public void start()
	{
		Socket connectionSocket = null;
		try
		{
			ServerSocket weclomeSocket = new ServerSocket(port);
			while (true)
			{
				connectionSocket = weclomeSocket.accept();
				//计时开始
				long start = System.currentTimeMillis();
				System.out.println("建立socket链接");
				
				//从客户端读取数据
				DataInputStream inFromClient = new DataInputStream(
						new BufferedInputStream(connectionSocket.getInputStream()));
				String filePath = inFromClient.readLine();
				System.out.println("read from client: " + filePath);
				// 选择进行发送的文件
				File fi = new File(filePath);

				System.out.println("文件长度:" + (int) fi.length());
				
				// 读取文件
				DataInputStream fis = new DataInputStream(
						new BufferedInputStream(new FileInputStream(filePath)));
				DataOutputStream ps = new DataOutputStream(connectionSocket.getOutputStream());
				// 将文件名及长度传给客户端。
				ps.writeUTF(fi.getName());//以UTF-8的编码方式写入文件名
				ps.flush();//迫使所有缓冲的输出字节被写出到流中
				ps.writeLong((long) fi.length());//文件的长度
				ps.flush();

				int bufferSize = 10000;
				byte[] buf = new byte[bufferSize];

				while (true)
				{
					int read = 0;
					if (fis != null)
					{
						read = fis.read(buf);
					}

					if (read == -1)
					{
						break;
					}
					ps.write(buf, 0, read);
				}
				ps.flush();
				//关闭连接
				fis.close();
				long finish = System.currentTimeMillis();
				connectionSocket.close();
				System.out.println("文件传输完成。发送耗时： " + (finish - start) + " ms.");
			}

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public static void main(String arg[])
	{
		TCPServer server = new TCPServer();
		server.start();
	}
}
