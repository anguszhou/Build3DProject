package networkingSwing;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.LookAndFeel;
import javax.swing.UIManager;
public class TCPServer extends JFrame {
	
	private static final long serialVersionUID = 6437172494588585597L;
	private final int  port = 1492;
	
	private JTextField filePath;	
	private JFileChooser directory;
	private String dir;	
	public static void main(String args[]) {
		try {
			UIManager.setLookAndFeel((LookAndFeel) Class.forName
					("com.sun.java.swing.plaf.windows.WindowsLookAndFeel").newInstance());		
			TCPServer frame = new TCPServer();
			frame.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public TCPServer() {
		super();
		setResizable(false);
		setTitle("TCP服务器端");
		setBounds(100, 100, 500, 375);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		final JPanel panel = new JPanel();
		panel.setLayout(null);
		getContentPane().add(panel, BorderLayout.CENTER);
		filePath = new JTextField();
		filePath.setBounds(30, 52, 303, 32);
		panel.add(filePath);
		final JButton button = new JButton();
		button.addActionListener(new ActionListener() {
			public void actionPerformed(final ActionEvent arg0) {				
				directory.showSaveDialog((Component)arg0.getSource());
				try {
					dir=directory.getSelectedFile().getCanonicalPath();
				} catch (IOException e) {					
					e.printStackTrace();
				}				
				filePath.setText(dir);
			}
		});
		button.setText("选择路径");
		button.setBounds(361, 54, 106, 28);		
		directory = new JFileChooser();
		directory.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		panel.add(button);
		final JButton button_1 = new JButton();
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(final ActionEvent arg0) {
				try{
					ServerSocket welcomeSocket = new ServerSocket(port);
					while (true) {
						Socket connectionSocket = welcomeSocket.accept();
						// 创建接收数据和发送数据的流
						DataOutputStream outToClient = new DataOutputStream(
						connectionSocket.getOutputStream());
						DataInputStream inFromClient = new DataInputStream(connectionSocket
								.getInputStream());
						int length;// 用来记录每一次传进来的数组中数据的长度
						int buffer = 3000;// 设置缓冲区的大小
						byte[] fromClientData = new byte[buffer];// 建立数组用来存储数据
						
						//接收文件名
						length = inFromClient.read(fromClientData, 0, buffer);
						String fileName = new String(fromClientData,0,length,"GBK");						
						String receivePath=dir+"\\"+fileName;
						File newpic = new File(receivePath);// 建立一个目标文件
						FileOutputStream Fout = new FileOutputStream(newpic);// 创建其输出流
						int i = 1;
						while ((length = inFromClient.read(fromClientData, 0, buffer)) != -1) {							
							Fout.write(fromClientData, 0, length);
							System.out.println("第"+ i++ +"帧:"+length+"字节");
							if (length != buffer )// 说明这是最后一次收到，没有将这缓冲区装满
							{
								//TCP 传输卡死调节参数 调节至40不会出现卡死
								Thread.sleep(40);
								int available = inFromClient.available();								
								if(available == 0)
									break;
							}							
						}
						Fout.close();						
						// 返回确认语句
						String confirm = "From server: " + fileName + " is received sucessfully!\n";
						outToClient.writeBytes(confirm);
						
						//welcomeSocket.close();
						//break;
						
					}
				}
				catch(Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		});
		button_1.setText("启动服务器端");
		button_1.setBounds(154, 171, 159, 28);
		panel.add(button_1);
	}
}
