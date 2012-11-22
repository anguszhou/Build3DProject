package chat;

import java.io.*;
import java.net.*;
import java.util.*;

public class MyServer {
	
	ServerSocket ss = null;//定义好成员变量
	boolean started = false;
	List <Client> clients = new ArrayList();//创建一个容器放客户数据包
	
	public static void main(String[] args){
		new MyServer().start();
	}
	
	public void start(){
		try {
		    ss = new ServerSocket(5555);//锁定一个TCP的端口
			started = true;
			System.out.println("服务器启动了");
		}catch(IOException e){
			System.out.println("端口正被使用中");//出现异常说明端口已被使用了
			System.exit(0);//退出程序
		}
		
		try{
			while(started){//不断的循环接受客户端的连接
				Socket s = ss.accept();
				Client c = new Client(s);
				new Thread(c).start();//把客户端的数据放进一个线程
				clients.add(c);
				System.out.println("新用户登陆服务器");
				System.out.println("用户Ip地址:"+s.getInetAddress()+" "+"端口号"+s.getPort());
				System.out.println("用户总数："+clients.size()+'\n');
			}
			
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				try {
					if(ss != null) ss.close();//服务器关闭要释放端口
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	}


	private class Client implements Runnable{
		
		private Socket s = null;//内部类的成员变量
		private DataInputStream dis = null;
		private DataOutputStream dos = null;
		private boolean bconnect = false;
		
		public Client(Socket s){//构造方法
			try {
				this.s = s;
				dis = new DataInputStream(s.getInputStream());//初始化输入流
				dos = new DataOutputStream(s.getOutputStream());
				bconnect = true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		public void run() {
			try {
				while(bconnect){//不断循环读客户端的数据
					String str = dis.readUTF();
					for(int i=0;i<clients.size();i++){//把接受到的数据向全部客户端转发
						Client c = clients.get(i);
						c.send(str);
					}
				}
			}catch(SocketException e){
				clients.remove(this);//客户端关闭要清除该客户端的信息
				System.out.println("一个客户离开");
				System.out.println("客户总数:"+clients.size()+'\n');
			} 
			catch (IOException e) {
				e.printStackTrace();
			}finally{
				try {
					if(dis != null) dis.close();//把不用的通道关闭了
					if(dos != null) dos.close();
					if(s != null) s.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		public void send(String str){//转发给客户端的方法
			try {
				dos.writeUTF(str);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	} 
}
