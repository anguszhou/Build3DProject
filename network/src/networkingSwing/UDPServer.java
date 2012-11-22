package networkingSwing;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.LookAndFeel;
import javax.swing.UIManager;

public class UDPServer extends JFrame {
	
	private static final long serialVersionUID = 5351070748786186568L;
	private final int  port = 9870;
	
	private JTextField filePath;
	private JFileChooser directory;
	private String dir;
	
	public static void main(String args[]) {
		try {
			UIManager.setLookAndFeel((LookAndFeel) Class.forName
					("com.sun.java.swing.plaf.windows.WindowsLookAndFeel").newInstance());		
			UDPServer frame = new UDPServer();
			frame.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public UDPServer() {
		super();
		setResizable(false);
		setTitle("UDP服务器端");
		setBounds(100, 100, 500, 375);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		final JPanel panel = new JPanel();
		panel.setLayout(null);
		getContentPane().add(panel, BorderLayout.CENTER);
		filePath = new JTextField();
		filePath.setBounds(29, 69, 303, 32);
		panel.add(filePath);
		final JButton button_1 = new JButton();
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(final ActionEvent arg0) {
				try{
					DatagramSocket serverSocket = new DatagramSocket(port);				
					while (true) {
						int buffer = 3000;// 设置缓冲区的大小
						byte[] receiveData = new byte[buffer];// 建立数组用来存储数据						
						//接收文件名
						DatagramPacket namePacket = new DatagramPacket(receiveData,receiveData.length);
						serverSocket.receive(namePacket);						
						String fileName = new String(receiveData,0,namePacket.getLength(),"GBK");
						System.out.println("文件名长度"+fileName.length()+"收到的文件名:"+fileName);
						String receivePath=dir+"\\"+fileName;
						File newpic = new File(receivePath);// 建立一个目标文件
						FileOutputStream Fout = new FileOutputStream(newpic);// 创建其输出流
						
						BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(receivePath+"_log.txt")));
						
						DatagramPacket receivePacket = new DatagramPacket(receiveData,receiveData.length);
						serverSocket.receive(receivePacket);
						// 如果得到数组的长度和缓冲区大小一样，那么说面还有数据；否则就是最后一组数据
						int i = 0;
						while (receivePacket.getLength() !=0) {						
							// 用该流将从客户端得到的数组写入文件中
							Fout.write(receiveData);
							String log = "第"+ i++ +"帧"+receivePacket.getLength()+"字节";
							bw.write(log+"\r\n");
							bw.flush();							
							serverSocket.receive(receivePacket);
							if(new String(receiveData,0,receivePacket.getLength(),"GBK").equals("end"))
								break;
						}
						Fout.close();
						bw.close();
						System.out.println("接收完成");
						serverSocket.close();
						break;
					}
				}catch(Exception e) {					
					e.printStackTrace();
				}
			}
		});
		button_1.setText("启动服务器端");
		button_1.setBounds(153, 188, 159, 28);
		panel.add(button_1);
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
		button.setBounds(360, 71, 106, 28);
		directory = new JFileChooser();
		directory.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		panel.add(button); 
	}
}
