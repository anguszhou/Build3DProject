package networkingSwing;

import java.net.*;   
import java.io.*;   
import java.util.*;   
import java.lang.*;   
import java.io.*;   
   
import java.net.*;   
   
public class FileServer {   
   
    public static void main(String[] args) throws Exception {   
   
        //�����ļ���������ȡ�ļ��е�����    
   
        File file = new File("d:\\ϵͳ�ص�.doc");   
   
        FileInputStream fos = new FileInputStream(file);   
   
        //����������������ܿͻ�����    
   
        ServerSocket ss = new ServerSocket(8801);   
   
        Socket client = ss.accept();   
   
        //����������������ṩ���ݰ�װ��    
   
        OutputStream netOut = client.getOutputStream();   
   
        OutputStream doc = new DataOutputStream(   
                new BufferedOutputStream(netOut));   
   
        //�����ļ���ȡ������    
   
        byte[] buf = new byte[2048];   
   
        int num = fos.read(buf);   
   
        while (num != (-1)) {//�Ƿ�����ļ�    
   
            doc.write(buf, 0, num);//���ļ�����д�����绺����    
   
            doc.flush();//ˢ�»�����������д���ͻ���    
   
            num = fos.read(buf);//�������ļ��ж�ȡ����    
   
        }   
   
        fos.close();   
   
        doc.close();   
   
    }   
   
}   
