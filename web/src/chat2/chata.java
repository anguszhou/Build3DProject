package chat2;

import java.io.*;   
import java.awt.*;   
import java.awt.event.*;   
import java.net.*;   
   
public class chata extends Frame implements ActionListener   
{   
    Label label = new Label("����");   
    Panel panel = new Panel();   
    TextField tf = new TextField(10);   
    TextArea ta = new TextArea();   
       
    public chata()   
    {   
        super("A��");   
        setSize(250,250);   
        panel.add(label);   
        panel.add(tf);   
        tf.addActionListener(this);   
        add("North",panel);   
        add("Center",ta);   
        addWindowListener(new WindowAdapter()   
        { public void windowClosing(WindowEvent e){System.exit(0);}});   
        show();   
        //startup listener    
        Listener listener = new Listener();   
        Thread thread = new Thread(listener);   
        thread.start();   
       
    }   
       
    public void actionPerformed(ActionEvent e)   
    {   
        //��Ҫ˵�Ļ�����ȥ    
        String str = tf.getText();   
        byte[] buf = str.getBytes();   
        tf.setText(null);   
        ta.append("��˵:"+str);   
        ta.append("\n");   
        try{   
            DatagramSocket socket = new DatagramSocket();   
            DatagramPacket packet = new DatagramPacket(buf,buf.length);   
            InetAddress remote_addr = InetAddress.getByName("localhost");   
            packet.setAddress(remote_addr);   
            //send to remote port 8877     
            packet.setPort(8877);   
            socket.send(packet);   
          }   
          catch (UnknownHostException uhe){   
            System.out.println("Unknown Host!");}   
          catch (IOException ioe){   
            System.out.println("IO Error!");}   
           
    }   
   
    class Listener implements Runnable{   
        public void run(){   
        try   
        {   
            for(;;)   
            {   
            //�������ض˿�8888    
            DatagramSocket socket = new DatagramSocket(8888);   
            DatagramPacket packet = new DatagramPacket(new byte[256], 256);   
            socket.receive(packet);   
            ByteArrayInputStream bin = new ByteArrayInputStream(packet.getData(),packet.getOffset(),packet.getLength());   
            DataInputStream din = new DataInputStream(bin);   
            String str = din.readLine(); 
            
            ta.append("�Է�˵��"+str);   
            ta.append("\n");   
            socket.close();   
            
           /* ����String z=(packet.getData()).toString(); ��Ϊ�� 
            String��z= new String(packet.getData(),packet.getOffset(),packet.getLength());�����ˡ� */
          }   
          }   
          catch (IOException ioe){   
            System.out.println("IO Error!");}   
        }   
}            
       
    public static void main(String args[])   
    {   
    chata a = new chata();   
    }   
}   
