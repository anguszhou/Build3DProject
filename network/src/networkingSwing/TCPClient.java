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
		setTitle("TCP�ͻ���");
		setBounds(100, 100, 500, 375);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		final JPanel panel = new JPanel();
		panel.setLayout(null);
		getContentPane().add(panel, BorderLayout.CENTER);

		filePath = new JTextField();
		filePath.setBounds(28, 23, 283, 22);
		panel.add(filePath);
		final JLabel label = new JLabel();
		label.setText("������Է�IP��ַ��");
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
				//��ͼ�����ļ��洢��byte�������� 
		        File pic=new File(filepath);//�����ļ�����
		        FileInputStream inFile;
				try {
					inFile = new FileInputStream(filepath);
		        	int buffer=3000;//���û������Ĵ�С 
		        	byte[] outToServerData=new byte[buffer];//���û��������� 
		        	//�����׽��֣��������������
		        	Socket clientSocket = new Socket(IP.getText(), port); 
		        	DataOutputStream outToServer = new DataOutputStream(clientSocket.getOutputStream());       
		        	BufferedReader inFromServer = new BufferedReader(new InputStreamReader(clientSocket.getInputStream())); 
		        	
		        	//��������˷����ļ���
		        	outToServer.write(pic.getName().getBytes("GBK"));
		        	Thread.sleep(500);
		        	
			        long time_start = System.nanoTime();//��ʼ��ʱ
			        int length;//��¼���δ��������Ĵ�С			        
			        while((length=inFile.read(outToServerData,0,buffer))!=-1){			        	
			        	outToServer.write(outToServerData,0,length);//���ļ������ݴ���ȥ 
			        	if(length!=buffer)//˵���������һ�η��ͣ�û�н��⻺����װ��
			        		break;			        	
			        }			       
			        inFile.close(); 
			        String confim=inFromServer.readLine();//�ӷ������õ�ȷ����Ϣ
			        server_mgs.setText(confim); 
			        clientSocket.close();			        
			        filelength.setText("�ļ��ĳ�����"+pic.length()+" bytes");
			        long time_end =System.nanoTime();//��ʱ����
			        long ii=(time_end - time_start)/1000000;
					time.setText("һ����ʱ" + ii + "����");
					System.out.println("��ʱ���ǣ�"+ii+"���룡");
				} catch (Exception e) {						
					e.printStackTrace();
				}
			  }
			});
		button.setText("�ϴ�");
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
		button_1.setText("���");
		button_1.setBounds(350, 20, 106, 28);
		scan=new FileDialog(this,"scan",FileDialog.LOAD);
		panel.add(button_1); 
	}
}
