package tcp;

import java.net.*;
import java.io.*;

public class TCPClientSocket
{
	private String ip;

	private int port;

	private Socket socket = null;

	DataOutputStream outToServer = null;

	DataInputStream getMessageStream = null;

	/**
	 * 构造函数
	 * @param ip
	 * @param port
	 */
	public TCPClientSocket(String ip, int port)
	{
		this.ip = ip;
		this.port = port;
	}

	/**
	 * 创建socket连接
	 * @throws Exception
	 */
	public void CreateConnection() throws Exception
	{
		try
		{
			socket = new Socket(ip, port);
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			if (socket != null)
				socket.close();
			throw e;
		} 
		finally
		{
		}
	}

	/**
	 * 向Server发送信息
	 * @param sendMessage
	 * @throws Exception
	 */
	public void sendMessage(String sendMessage) throws Exception
	{
		try
		{
			outToServer = new DataOutputStream(socket.getOutputStream());
			outToServer.writeBytes(sendMessage + '\n');
			outToServer.flush();
			return;
			
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			if (outToServer != null)
				outToServer.close();
			throw e;
		}
		finally
		{
		}
	}

	/**
	 * 建立来自套接字的输入
	 * @return
	 * @throws Exception
	 */
	public DataInputStream getMessageStream() throws Exception
	{
		try
		{
			getMessageStream = new DataInputStream(new BufferedInputStream(
					socket.getInputStream()));
			return getMessageStream;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			if (getMessageStream != null)
				getMessageStream.close();
			throw e;
		} 
		finally
		{
		}
	}

	/**
	 * 关闭连接
	 */
	public void closeConnection()
	{
		try
		{
			if (outToServer != null)
				outToServer.close();
			if (getMessageStream != null)
				getMessageStream.close();
			if (socket != null)
				socket.close();
		} catch (Exception e)
		{

		}
	}
}
