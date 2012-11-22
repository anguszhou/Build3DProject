package chat2;

import java.io.*;   
import java.awt.*;   
import java.awt.event.*;   
import java.net.*;   
   
public class chatb extends Frame implements ActionListener   
{   
    Label label = new Label("发言");   
    Panel panel = new Panel();   
    TextField tf = new TextField(10);   
    TextArea ta = new TextArea();   
       
    public chatb()   
    {   
        super("B方");   
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
        //把要说的话发出去    
        String str = tf.getText();   
        byte[] buf = str.getBytes();   
        tf.setText(null);   
        ta.append("俺说:"+str);   
        ta.append("\n");   
        try{   
            DatagramSocket socket = new DatagramSocket();   
            DatagramPacket packet = new DatagramPacket(buf,buf.length);   
            InetAddress remote_addr = InetAddress.getByName("localhost");   
            packet.setAddress(remote_addr);   
            //send to remote port 8888     
            packet.setPort(8888);   
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
            //监听本地端口8877    
            DatagramSocket socket = new DatagramSocket(8877);   
            DatagramPacket packet = new DatagramPacket(new byte[256], 256);   
            socket.receive(packet);   
            ByteArrayInputStream bin = new ByteArrayInputStream(packet.getData(),packet.getOffset(),packet.getLength());   
            DataInputStream din = new DataInputStream(bin);   
            String str = din.readLine();   
            ta.append("对方说："+str);   
            ta.append("\n");   
            socket.close();   
          }   
               
          }   
          catch (IOException ioe){   
            System.out.println("IO Error!");}   
        }   
}            
       
    public static void main(String args[])   
    {   
    chatb b = new chatb();   
    }   
}   
