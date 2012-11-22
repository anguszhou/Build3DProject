package chat;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
import java.text.*;
import java.util.Date;
import java.util.Locale;

public class MyClient extends Frame {
	
	TextArea ta = new TextArea();//创建一个显示框
	TextField tf = new TextField();//创建一个单行编辑文本框
	Button b = new Button();//创建一个按钮
	TextField tff = new TextField();
	Name n = new Name();
	
	DataOutputStream dos = null;//定义各种成员变量
	DataInputStream dis = null;
	Socket s = null;
	boolean bconnect = false;
	String name = null;
	
	public static void main(String[] args) {
		new MyClient().client();//主函数调用客户登陆端方法
	}
	
	public void client(){//客户登陆端
		setTitle("客户登陆窗口");//设置标题
		setLocation(300,300);//出现位置
		setSize(300,50);//大小
		b.setLabel("登陆");
		add(tff,BorderLayout.CENTER);
		add(b,BorderLayout.EAST);
		addWindowListener(new WindowAdapter(){//匿名类实现关闭窗口
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}}); 
		b.addActionListener(n);//按钮的一个事件监听
		tff.addActionListener(n);//单行文本框的事件监听
		setVisible(true);//设置可视化
	}
	
	private class Name implements ActionListener{//tff对象的事件处理

		public void actionPerformed(ActionEvent arg0) {
	         name = tff.getText();
	         b.setLabel("用户名");
	         b.removeActionListener(n);//出去按钮监听
	         tff.removeActionListener(n);
	         launchFrame();//调用聊天框方法
		}
	}
	
	public void launchFrame(){
		setTitle(name);
		setLocation(300,400);
		setSize(300,300);
		add(ta,BorderLayout.NORTH);//用布局管理器分布好各种对象
		add(tf,BorderLayout.SOUTH);
		pack();
		addWindowListener(new WindowAdapter(){
			public void windowClosing(WindowEvent e) {
				disconnect();
				System.exit(0);
			}}); 
		connect();
		tf.addActionListener(new WriteListener());//单行文本框的另一个事件监听
		new Thread(new ReadWord()).start();//开一个接受服务器字符的线程
		setVisible(true);
	}
	
	private class WriteListener implements ActionListener{//tf对象的事件处理

		public void actionPerformed(ActionEvent arg0) {
			String str = tf.getText().trim();//获取输入的字符串
			tf.setText("");
			try {
				Date date = new Date(System.currentTimeMillis());//获取当前的时间日期
				DateFormat df = DateFormat.getDateTimeInstance(DateFormat.MEDIUM,DateFormat.MEDIUM,Locale.CHINA);
				String dt = df.format(date);
				dos.writeUTF(name+":"+dt);//把输入tf的字符串，以及当前时间日期发给服务器
				dos.writeUTF("   "+str);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void connect(){
		try {
			s = new Socket("127.0.0.1",5555);//连接服务器的地址和端口
			dos = new DataOutputStream(s.getOutputStream());//初始化输出流
			dis = new DataInputStream(s.getInputStream());
			bconnect = true;
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void disconnect(){//关闭客户端关闭建立好的通道
		try {
			if(dos != null) dos.close();
			if(dis != null) dis.close();
			if(s != null) s.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private class ReadWord implements Runnable{//用线程不断的接受服务器发给来的字符串
		
		public void run() {
			try {
				while(bconnect){
					String str = dis.readUTF();
					ta.setText(ta.getText()+str+'\n');//把接收到的信息输出在显示框里
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
