package networkingSwing;

import java.awt.BorderLayout;
import java.awt.FileDialog;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileInputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.LookAndFeel;
import javax.swing.UIManager;
public class UDPClient extends JFrame {
	
	private static final long serialVersionUID = -1976553255476769970L;
	private final int  port = 9870;
	
	private JTextField IP;
	private JTextField filePath;
	private FileDialog scan;
	String Filename,dir;
	public static void main(String args[]) {
		try {
			UIManager.setLookAndFeel((LookAndFeel) Class.forName
					("com.sun.java.swing.plaf.windows.WindowsLookAndFeel").newInstance());		
			UDPClient frame = new UDPClient();
			frame.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public UDPClient() {
		super();
		setResizable(false);
		setTitle("UDP客户端");
		setBounds(100, 100, 500, 375);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		final JPanel panel = new JPanel();
		panel.setLayout(null);
		getContentPane().add(panel, BorderLayout.CENTER);
		filePath = new JTextField();
		filePath.setBounds(29, 27, 283, 22);
		panel.add(filePath);
		final JLabel filelength = new JLabel();
		filelength.setBounds(29, 180, 283, 28);
		panel.add(filelength);
		final JLabel time = new JLabel();
		time.setBounds(29, 248, 283, 28);
		panel.add(time);
		final JButton button_1 = new JButton();
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(final ActionEvent arg0) {
				scan.setVisible(true); 
				Filename=scan.getFile(); 
				dir=scan.getDirectory();
				filePath.setText(dir+Filename);
			}
		});
		button_1.setText("浏览");
		button_1.setBounds(351, 24, 106, 28);
		scan=new FileDialog(this,"scan",FileDialog.LOAD);
		panel.add(button_1);
		final JLabel label = new JLabel();
		label.setText("请输入对方IP地址：");
		label.setBounds(29, 71, 159, 22);
		panel.add(label);
		IP = new JTextField();
		IP.setBounds(29, 106, 283, 22);
		IP.setText("192.168.0.160");
		panel.add(IP);
		final JButton button = new JButton();
		button.addActionListener(new ActionListener() {
			public void actionPerformed(final ActionEvent arg0) {
				String filepath=dir+Filename;
				try{
				DatagramSocket clientSocket = new DatagramSocket();
				InetAddress IPAddress = InetAddress.getByName(IP.getText());
				
				//向服务器端发送文件名
				byte[] filename = Filename.getBytes("GBK");
				DatagramPacket namePacket = new DatagramPacket(filename,
						filename.length, IPAddress, port);
				clientSocket.send(namePacket);				
	        	Thread.sleep(500);
				
				File pic = new File(filepath);				
				FileInputStream input = new FileInputStream(pic);
				int length = 3000;// 设定缓冲区的大小
				byte[] sendData = new byte[length];// 创建缓冲区
				long time_start = System.nanoTime();// 刚开始发送照片的时间
				
				int i = 0;
				int temp;// 用来记录本次发送的缓冲区的大小
				while ((temp = input.read(sendData, 0, length)) != -1) {
					DatagramPacket sendPacket = new DatagramPacket(sendData,
							temp, IPAddress, port);
					clientSocket.send(sendPacket);
					//UDP的QoS严重依赖发送速率
					if(i%1 == 0)
						Thread.sleep(2);
					System.out.println("第"+ i++ +"帧");
					if (temp != length)// 说明这是最后一次发送，没有将这缓冲区装满
						break;
				}
				input.close();
				
				byte[] end_msg = "end".getBytes("GBK");
				DatagramPacket end = new DatagramPacket(end_msg,end_msg.length, IPAddress, port);
				for(int j = 0;j<10;j++)
					clientSocket.send(end);				
				clientSocket.close(); // no msg to be sent
				
				String yy=new Long(pic.length()).toString();
				filelength.setText("文件的长度是：" + yy + " bytes");				
				long time_end = System.nanoTime();// 最后收到服务器确认信息的时间
				long ii=(time_end - time_start)/1000000;
				time.setText("一共用时" + ii + "毫秒");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		});
		button.setText("上传");
		button.setBounds(351, 103, 106, 28);
		panel.add(button);
	}
}
