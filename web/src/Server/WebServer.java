package Server;

import java.io.*;   
import java.net.*;   
public class WebServer {   
public static void main(String args[]) {   
    int i=1, PORT=8080;   
    ServerSocket server=null;   
    Socket client=null;   
    try {   
        server=new ServerSocket(PORT);   
        System.out.println("Web Server is listening on port "+server.getLocalPort());   
        for (;;) {   
            client=server.accept(); // ���ܿͻ�������������    
            new ConnectionThread(client,i).start();   
            i++;   
            }   
        } catch (Exception e){   
            System.out.println(e);   
            }   
        }   
}   
/* ConnnectionThread�������һ��Web�������ͨ�� */   
class ConnectionThread extends Thread {   
    Socket client; // ����Web�������socket��    
    int counter; // ������    
    public ConnectionThread(Socket cl,int c) {   
        client = cl;   
        counter = c;   
        }   
    public void run() // �߳���    
    {   
        try {   
            String destIP=client.getInetAddress().toString(); // �ͻ���IP��ַ    
            int destport=client.getPort(); // �ͻ����˿ں�    
            System.out.println("Connection "+counter+":connected to "+destIP+" on port "+destport+".");   
            PrintStream outstream=new PrintStream(client.getOutputStream());   
            BufferedReader instream   
              = new BufferedReader(new InputStreamReader(client.getInputStream()));   
            String inline=instream.readLine(); // ��ȡWeb������ύ��������Ϣ    
            System.out.println("Received:"+inline);   
            if (getrequest(inline)) { // �����GET����    
                String filename=getfilename(inline);   
                File file=new File(filename);   
                if (file.exists()) { // ���ļ����ڣ����ļ��͸�Web�����    
                    System.out.println(filename+" requested.");   
                    outstream.println("HTTP/1.0 200 OK");   
                    outstream.println("MIME_version:1.0");   
                    outstream.println("Content_Type:text/html");   
                    int len=(int)file.length();   
                    outstream.println("Content_Length:"+len);   
                    outstream.println("");   
                    sendfile(outstream,file); // �����ļ�    
                    outstream.flush();   
                    } else { // �ļ�������ʱ    
                        String notfound="<HTML><HEAD>" +   
                                "<H1>Error 404-file not found</H1>";   
                        outstream.println("HTTP/1.0 404 no found");   
                        outstream.println("Content_Type:text/html");   
                        outstream.println("Content_Length:"+notfound.length()+2);   
                        outstream.println("");   
                        outstream.println(notfound);   
                        outstream.flush();   
                        }   
                }   
            long m1=1;    
            while (m1<11100000) {m1++;} // ��ʱ    
            client.close();   
            } catch (IOException e){   
                System.out.println("Exception:"+e);   
                }   
            }   
    /* ��ȡ���������Ƿ�Ϊ��GET�� */   
    boolean getrequest(String s) {    
        if (s.length()>0)   
        {   
            if (s.substring(0,3).equalsIgnoreCase("GET"))   
                return true;   
            }   
        return false;   
        }   
    /* ��ȡҪ���ʵ��ļ��� */   
    String getfilename(String s) {   
        String f=s.substring(s.indexOf(' ')+1);   
        f = f.substring(0,f.indexOf(' '));   
        try {   
            if (f.charAt(0)=='/')   
                f=f.substring(1);   
            } catch (StringIndexOutOfBoundsException e) {   
                System.out.println("Exception:"+e);   
                }   
            if(f.equals(""))   
                f="index.html";   
            return f;   
            }   
    /*��ָ���ļ����͸�Web����� */    
    void sendfile(PrintStream outs,File file) {   
        try {   
            DataInputStream in=new DataInputStream(new FileInputStream(file));   
            int len=(int)file.length();   
            byte buf[]=new byte[len];   
            in.readFully(buf);   
            outs.write(buf,0,len);   
            outs.flush();   
            in.close();   
            } catch (Exception e){   
                System.out.println("Error retrieving file.");   
                System.exit(1);   
                }   
            }   
    }   
