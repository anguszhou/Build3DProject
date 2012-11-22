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
		setTitle("TCP��������");
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
		button.setText("ѡ��·��");
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
						// �����������ݺͷ������ݵ���
						DataOutputStream outToClient = new DataOutputStream(
						connectionSocket.getOutputStream());
						DataInputStream inFromClient = new DataInputStream(connectionSocket
								.getInputStream());
						int length;// ������¼ÿһ�δ����������������ݵĳ���
						int buffer = 3000;// ���û������Ĵ�С
						byte[] fromClientData = new byte[buffer];// �������������洢����
						
						//�����ļ���
						length = inFromClient.read(fromClientData, 0, buffer);
						String fileName = new String(fromClientData,0,length,"GBK");						
						String receivePath=dir+"\\"+fileName;
						File newpic = new File(receivePath);// ����һ��Ŀ���ļ�
						FileOutputStream Fout = new FileOutputStream(newpic);// �����������
						int i = 1;
						while ((length = inFromClient.read(fromClientData, 0, buffer)) != -1) {							
							Fout.write(fromClientData, 0, length);
							System.out.println("��"+ i++ +"֡:"+length+"�ֽ�");
							if (length != buffer )// ˵���������һ���յ���û�н��⻺����װ��
							{
								//TCP ���俨�����ڲ��� ������40������ֿ���
								Thread.sleep(40);
								int available = inFromClient.available();								
								if(available == 0)
									break;
							}							
						}
						Fout.close();						
						// ����ȷ�����
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
		button_1.setText("������������");
		button_1.setBounds(154, 171, 159, 28);
		panel.add(button_1);
	}
}
