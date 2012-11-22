package tcp;

import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileOutputStream;

public class TCPClient
{
	private TCPClientSocket cs = null;

	private String ip = "localhost";// ���óɷ�����IP

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
			System.out.print("���ӷ������ɹ�!");
			return true;
		}
		catch (Exception e)
		{
			System.out.print("���ӷ�����ʧ��!");
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
			System.out.print("������Ϣʧ��!" + "\n");
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
			System.out.print("������Ϣ�������\n");
			e.printStackTrace();
			return;
		}

		try
		{
			// ���ر���·�����ļ�����ӷ������˴�����
			String savePath = "E:\\";
			int bufferSize = 10000;
			byte[] buf = new byte[bufferSize];
	//		int passedlen = 0;
			long len = 0;
			
			//�����ļ�
			savePath += inputStream.readUTF();
			DataOutputStream fileOut = new DataOutputStream(
					new BufferedOutputStream(new BufferedOutputStream(
							new FileOutputStream(savePath))));
			len = inputStream.readLong();

			System.out.println("�ļ��ĳ���Ϊ:" + len);
			long start = System.currentTimeMillis();
			System.out.println("��ʼ�����ļ�...");

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
				// �����������Ϊͼ�ν����prograssBar���ģ���������Ǵ��ļ������ܻ��ظ���ӡ��һЩ��ͬ�İٷֱ�
		//		System.out.println("�ļ�������" + (passedlen * 100 / len) + "%\n");
				fileOut.write(buf, 0, read);
			}
			long finish = System.currentTimeMillis();
			System.out.println("�ļ�������ɡ����ܺ�ʱ�� " + (finish - start) + " ms. �ļ���Ϊ�� " + savePath);
			fileOut.close();
		}
		catch (Exception e)
		{
			System.out.println("������Ϣ����.");
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