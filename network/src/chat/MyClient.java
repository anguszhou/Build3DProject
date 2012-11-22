package chat;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
import java.text.*;
import java.util.Date;
import java.util.Locale;

public class MyClient extends Frame {
	
	TextArea ta = new TextArea();//����һ����ʾ��
	TextField tf = new TextField();//����һ�����б༭�ı���
	Button b = new Button();//����һ����ť
	TextField tff = new TextField();
	Name n = new Name();
	
	DataOutputStream dos = null;//������ֳ�Ա����
	DataInputStream dis = null;
	Socket s = null;
	boolean bconnect = false;
	String name = null;
	
	public static void main(String[] args) {
		new MyClient().client();//���������ÿͻ���½�˷���
	}
	
	public void client(){//�ͻ���½��
		setTitle("�ͻ���½����");//���ñ���
		setLocation(300,300);//����λ��
		setSize(300,50);//��С
		b.setLabel("��½");
		add(tff,BorderLayout.CENTER);
		add(b,BorderLayout.EAST);
		addWindowListener(new WindowAdapter(){//������ʵ�ֹرմ���
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}}); 
		b.addActionListener(n);//��ť��һ���¼�����
		tff.addActionListener(n);//�����ı�����¼�����
		setVisible(true);//���ÿ��ӻ�
	}
	
	private class Name implements ActionListener{//tff������¼�����

		public void actionPerformed(ActionEvent arg0) {
	         name = tff.getText();
	         b.setLabel("�û���");
	         b.removeActionListener(n);//��ȥ��ť����
	         tff.removeActionListener(n);
	         launchFrame();//��������򷽷�
		}
	}
	
	public void launchFrame(){
		setTitle(name);
		setLocation(300,400);
		setSize(300,300);
		add(ta,BorderLayout.NORTH);//�ò��ֹ������ֲ��ø��ֶ���
		add(tf,BorderLayout.SOUTH);
		pack();
		addWindowListener(new WindowAdapter(){
			public void windowClosing(WindowEvent e) {
				disconnect();
				System.exit(0);
			}}); 
		connect();
		tf.addActionListener(new WriteListener());//�����ı������һ���¼�����
		new Thread(new ReadWord()).start();//��һ�����ܷ������ַ����߳�
		setVisible(true);
	}
	
	private class WriteListener implements ActionListener{//tf������¼�����

		public void actionPerformed(ActionEvent arg0) {
			String str = tf.getText().trim();//��ȡ������ַ���
			tf.setText("");
			try {
				Date date = new Date(System.currentTimeMillis());//��ȡ��ǰ��ʱ������
				DateFormat df = DateFormat.getDateTimeInstance(DateFormat.MEDIUM,DateFormat.MEDIUM,Locale.CHINA);
				String dt = df.format(date);
				dos.writeUTF(name+":"+dt);//������tf���ַ������Լ���ǰʱ�����ڷ���������
				dos.writeUTF("   "+str);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void connect(){
		try {
			s = new Socket("127.0.0.1",5555);//���ӷ������ĵ�ַ�Ͷ˿�
			dos = new DataOutputStream(s.getOutputStream());//��ʼ�������
			dis = new DataInputStream(s.getInputStream());
			bconnect = true;
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void disconnect(){//�رտͻ��˹رս����õ�ͨ��
		try {
			if(dos != null) dos.close();
			if(dis != null) dis.close();
			if(s != null) s.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private class ReadWord implements Runnable{//���̲߳��ϵĽ��ܷ��������������ַ���
		
		public void run() {
			try {
				while(bconnect){
					String str = dis.readUTF();
					ta.setText(ta.getText()+str+'\n');//�ѽ��յ�����Ϣ�������ʾ����
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
