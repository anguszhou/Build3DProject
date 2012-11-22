package chat;

import java.io.*;
import java.net.*;
import java.util.*;

public class MyServer {
	
	ServerSocket ss = null;//����ó�Ա����
	boolean started = false;
	List <Client> clients = new ArrayList();//����һ�������ſͻ����ݰ�
	
	public static void main(String[] args){
		new MyServer().start();
	}
	
	public void start(){
		try {
		    ss = new ServerSocket(5555);//����һ��TCP�Ķ˿�
			started = true;
			System.out.println("������������");
		}catch(IOException e){
			System.out.println("�˿�����ʹ����");//�����쳣˵���˿��ѱ�ʹ����
			System.exit(0);//�˳�����
		}
		
		try{
			while(started){//���ϵ�ѭ�����ܿͻ��˵�����
				Socket s = ss.accept();
				Client c = new Client(s);
				new Thread(c).start();//�ѿͻ��˵����ݷŽ�һ���߳�
				clients.add(c);
				System.out.println("���û���½������");
				System.out.println("�û�Ip��ַ:"+s.getInetAddress()+" "+"�˿ں�"+s.getPort());
				System.out.println("�û�������"+clients.size()+'\n');
			}
			
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				try {
					if(ss != null) ss.close();//�������ر�Ҫ�ͷŶ˿�
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	}


	private class Client implements Runnable{
		
		private Socket s = null;//�ڲ���ĳ�Ա����
		private DataInputStream dis = null;
		private DataOutputStream dos = null;
		private boolean bconnect = false;
		
		public Client(Socket s){//���췽��
			try {
				this.s = s;
				dis = new DataInputStream(s.getInputStream());//��ʼ��������
				dos = new DataOutputStream(s.getOutputStream());
				bconnect = true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		public void run() {
			try {
				while(bconnect){//����ѭ�����ͻ��˵�����
					String str = dis.readUTF();
					for(int i=0;i<clients.size();i++){//�ѽ��ܵ���������ȫ���ͻ���ת��
						Client c = clients.get(i);
						c.send(str);
					}
				}
			}catch(SocketException e){
				clients.remove(this);//�ͻ��˹ر�Ҫ����ÿͻ��˵���Ϣ
				System.out.println("һ���ͻ��뿪");
				System.out.println("�ͻ�����:"+clients.size()+'\n');
			} 
			catch (IOException e) {
				e.printStackTrace();
			}finally{
				try {
					if(dis != null) dis.close();//�Ѳ��õ�ͨ���ر���
					if(dos != null) dos.close();
					if(s != null) s.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		public void send(String str){//ת�����ͻ��˵ķ���
			try {
				dos.writeUTF(str);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	} 
}
