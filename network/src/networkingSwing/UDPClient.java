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
		setTitle("UDP�ͻ���");
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
		button_1.setText("���");
		button_1.setBounds(351, 24, 106, 28);
		scan=new FileDialog(this,"scan",FileDialog.LOAD);
		panel.add(button_1);
		final JLabel label = new JLabel();
		label.setText("������Է�IP��ַ��");
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
				
				//��������˷����ļ���
				byte[] filename = Filename.getBytes("GBK");
				DatagramPacket namePacket = new DatagramPacket(filename,
						filename.length, IPAddress, port);
				clientSocket.send(namePacket);				
	        	Thread.sleep(500);
				
				File pic = new File(filepath);				
				FileInputStream input = new FileInputStream(pic);
				int length = 3000;// �趨�������Ĵ�С
				byte[] sendData = new byte[length];// ����������
				long time_start = System.nanoTime();// �տ�ʼ������Ƭ��ʱ��
				
				int i = 0;
				int temp;// ������¼���η��͵Ļ������Ĵ�С
				while ((temp = input.read(sendData, 0, length)) != -1) {
					DatagramPacket sendPacket = new DatagramPacket(sendData,
							temp, IPAddress, port);
					clientSocket.send(sendPacket);
					//UDP��QoS����������������
					if(i%1 == 0)
						Thread.sleep(2);
					System.out.println("��"+ i++ +"֡");
					if (temp != length)// ˵���������һ�η��ͣ�û�н��⻺����װ��
						break;
				}
				input.close();
				
				byte[] end_msg = "end".getBytes("GBK");
				DatagramPacket end = new DatagramPacket(end_msg,end_msg.length, IPAddress, port);
				for(int j = 0;j<10;j++)
					clientSocket.send(end);				
				clientSocket.close(); // no msg to be sent
				
				String yy=new Long(pic.length()).toString();
				filelength.setText("�ļ��ĳ����ǣ�" + yy + " bytes");				
				long time_end = System.nanoTime();// ����յ�������ȷ����Ϣ��ʱ��
				long ii=(time_end - time_start)/1000000;
				time.setText("һ����ʱ" + ii + "����");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		});
		button.setText("�ϴ�");
		button.setBounds(351, 103, 106, 28);
		panel.add(button);
	}
}
