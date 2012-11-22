package networkingSwing;

import java.io.*;   

import java.net.*;   
   
public class FileClient {   
   
    public static void main(String[] args) throws Exception {   
   
        //ʹ�ñ����ļ�ϵͳ�����������ݲ���Ϊ���ļ�    
   
        File file = new File("d:\\fmd.doc");   
   
        file.createNewFile();   
   
        RandomAccessFile raf = new RandomAccessFile(file, "rw");   
   
        // ͨ��Socket�����ļ�������    
   
        Socket server = new Socket(InetAddress.getLocalHost(), 3318);   
        //����������������ܷ������ļ�����    
        InputStream netIn = server.getInputStream();   
        InputStream in = new DataInputStream(new BufferedInputStream(netIn));   
        //����������������������    
   
        byte[] buf = new byte[2048];   
   
        int num = in.read(buf);   
   
        while (num != (-1)) {//�Ƿ������������    
   
            raf.write(buf, 0, num);//������д���ļ�    
   
            raf.skipBytes(num);//˳��д�ļ��ֽ�    
   
            num = in.read(buf);//�����������ж�ȡ�ļ�    
   
        }   
   
        in.close();   
   
        raf.close();   
   
    }   
   
}   
