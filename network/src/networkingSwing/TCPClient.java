package networkingSwing;

import java.awt.BorderLayout;
import java.awt.FileDialog;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.Socket;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.LookAndFeel;
import javax.swing.UIManager;
public class TCPClient extends JFrame {
	
	private static final long serialVersionUID = -8242418252683722174L;
	private final int  port = 1492;
	
	private JTextField IP;
	private JTextField filePath;
	private FileDialog scan;
	String Filename,dir;
	public static void main(String args[]) {
		try {
			UIManager.setLookAndFeel((LookAndFeel) Class.forName
					("com.sun.java.swing.plaf.windows.WindowsLookAndFeel").newInstance());		
			TCPClient frame = new TCPClient();
			frame.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public TCPClient() {
		super();
		setResizable(false);
		setTitle("TCP客户端");
		setBounds(100, 100, 500, 375);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		final JPanel panel = new JPanel();
		panel.setLayout(null);
		getContentPane().add(panel, BorderLayout.CENTER);

		filePath = new JTextField();
		filePath.setBounds(28, 23, 283, 22);
		panel.add(filePath);
		final JLabel label = new JLabel();
		label.setText("请输入对方IP地址：");
		label.setBounds(28, 67, 159, 22);
		panel.add(label);
		final JLabel server_mgs = new JLabel();
		server_mgs.setBounds(28, 174, 283, 28);
		panel.add(server_mgs);
		final JLabel filelength = new JLabel();
		filelength.setBounds(28, 226, 283, 28);
		panel.add(filelength);
		final JLabel time = new JLabel();
		time.setBounds(28, 276, 283, 22);
		panel.add(time);
		IP = new JTextField();
		IP.setBounds(28, 102, 283, 22);
		IP.setText("192.168.0.160");
		panel.add(IP);
		final JButton button = new JButton();
		button.addActionListener(new ActionListener() {
			public void actionPerformed(final ActionEvent arg0){

				server_mgs.setText("");		       
		        filelength.setText("");		        
				time.setText("");

				String filepath=dir+Filename;
				//将图像当作文件存储到byte数组里面 
		        File pic=new File(filepath);//创建文件对象
		        FileInputStream inFile;
				try {
					inFile = new FileInputStream(filepath);
		        	int buffer=3000;//设置缓冲区的大小 
		        	byte[] outToServerData=new byte[buffer];//设置缓冲区数组 
		        	//建立套接字，及其输入输出流
		        	Socket clientSocket = new Socket(IP.getText(), port); 
		        	DataOutputStream outToServer = new DataOutputStream(clientSocket.getOutputStream());       
		        	BufferedReader inFromServer = new BufferedReader(new InputStreamReader(clientSocket.getInputStream())); 
		        	
		        	//向服务器端发送文件名
		        	outToServer.write(pic.getName().getBytes("GBK"));
		        	Thread.sleep(500);
		        	
			        long time_start = System.nanoTime();//开始计时
			        int length;//记录本次传输的数组的大小			        
			        while((length=inFile.read(outToServerData,0,buffer))!=-1){			        	
			        	outToServer.write(outToServerData,0,length);//将文件的数据传出去 
			        	if(length!=buffer)//说明这是最后一次发送，没有将这缓冲区装满
			        		break;			        	
			        }			       
			        inFile.close(); 
			        String confim=inFromServer.readLine();//从服务器得到确认信息
			        server_mgs.setText(confim); 
			        clientSocket.close();			        
			        filelength.setText("文件的长度是"+pic.length()+" bytes");
			        long time_end =System.nanoTime();//计时结束
			        long ii=(time_end - time_start)/1000000;
					time.setText("一共用时" + ii + "毫秒");
					System.out.println("总时间是："+ii+"毫秒！");
				} catch (Exception e) {						
					e.printStackTrace();
				}
			  }
			});
		button.setText("上传");
		button.setBounds(350, 99, 106, 28);
		panel.add(button);
		final JButton button_1 = new JButton();
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(final ActionEvent arg0) {
				scan.setVisible(true); 
				Filename=scan.getFile(); 
				dir=scan.getDirectory();
				filePath.setText(dir+Filename);			}
		});
		button_1.setText("浏览");
		button_1.setBounds(350, 20, 106, 28);
		scan=new FileDialog(this,"scan",FileDialog.LOAD);
		panel.add(button_1); 
	}
}
