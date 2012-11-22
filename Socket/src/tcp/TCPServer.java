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
				//��ʱ��ʼ
				long start = System.currentTimeMillis();
				System.out.println("����socket����");
				
				//�ӿͻ��˶�ȡ����
				DataInputStream inFromClient = new DataInputStream(
						new BufferedInputStream(connectionSocket.getInputStream()));
				String filePath = inFromClient.readLine();
				System.out.println("read from client: " + filePath);
				// ѡ����з��͵��ļ�
				File fi = new File(filePath);

				System.out.println("�ļ�����:" + (int) fi.length());
				
				// ��ȡ�ļ�
				DataInputStream fis = new DataInputStream(
						new BufferedInputStream(new FileInputStream(filePath)));
				DataOutputStream ps = new DataOutputStream(connectionSocket.getOutputStream());
				// ���ļ��������ȴ����ͻ��ˡ�
				ps.writeUTF(fi.getName());//��UTF-8�ı��뷽ʽд���ļ���
				ps.flush();//��ʹ���л��������ֽڱ�д��������
				ps.writeLong((long) fi.length());//�ļ��ĳ���
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
				//�ر�����
				fis.close();
				long finish = System.currentTimeMillis();
				connectionSocket.close();
				System.out.println("�ļ�������ɡ����ͺ�ʱ�� " + (finish - start) + " ms.");
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
