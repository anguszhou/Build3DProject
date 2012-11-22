package cn.edu.xjtu.ects.web;
/*
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

public class UploadServlet extends HttpServlet {

	
	 File tmpDir = null;//��ʼ���ϴ��ļ�����ʱ���Ŀ¼
	 File saveDir = null;//��ʼ���ϴ��ļ���ı���Ŀ¼

public UploadServlet() {
   super();
}

public void destroy() {
   super.destroy(); // Just puts "destroy" string in log
   // Put your code here
}

public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
   doPost(request, response);
}

@SuppressWarnings("deprecation")
public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
   final long MAX_SIZE = 3 * 1024 * 1024;// �����ϴ��ļ����Ϊ 3M
   // �����ϴ����ļ���ʽ���б�
   final String[] allowedExt = new String[] { "jpg", "jpeg", "gif", "txt",
     "doc", "docx", "mp3", "wma", "m4a" };
   response.setContentType("text/html");
   // �����ַ�����ΪUTF-8, ����֧�ֺ�����ʾ
   response.setCharacterEncoding("GBK");

   // ʵ����һ��Ӳ���ļ�����,���������ϴ����ServletFileUpload
   DiskFileItemFactory dfif = new DiskFileItemFactory();
   dfif.setSizeThreshold(4096);// �����ϴ��ļ�ʱ������ʱ����ļ����ڴ��С,������4K.���ڵĲ��ֽ���ʱ����Ӳ��
   
   dfif.setRepository(new File(request.getRealPath("/")   	   
     + "ImagesUploaded"));// ���ô����ʱ�ļ���Ŀ¼,web��Ŀ¼�µ�ImagesUploadedĿ¼

   // �����Ϲ���ʵ�����ϴ����
   ServletFileUpload sfu = new ServletFileUpload(dfif);
   // ��������ϴ��ߴ�
   sfu.setSizeMax(MAX_SIZE);

   PrintWriter out = response.getWriter();
   // ��request�õ� ���� �ϴ�����б�
   List fileList = null;
   try {
    fileList = sfu.parseRequest(request);
   } catch (FileUploadException e) {// �����ļ��ߴ�����쳣
    if (e instanceof SizeLimitExceededException) {
     out.println("�ļ��ߴ糬���涨��С:" + MAX_SIZE + "�ֽ�<p />");
     out.println("<a href=\"upload.html\" target=\"_top\">����</a>");
     return;
    }
    e.printStackTrace();
   }
   // û���ļ��ϴ�
   if (fileList == null || fileList.size() == 0) {
    out.println("��ѡ���ϴ��ļ�<p />");
    out.println("<a href=\"upload.html\" target=\"_top\">����</a>");
    return;
   }
   // �õ������ϴ����ļ�
   Iterator fileItr = fileList.iterator();
   int i=0;
   // ѭ�����������ļ�
   while (fileItr.hasNext()) {
    FileItem fileItem = null;
    String path = null;
    long size = 0;
    // �õ���ǰ�ļ�
    fileItem = (FileItem) fileItr.next();
   //FileItem fis = fileItem;
    i++;
    // ���Լ�form�ֶζ������ϴ�����ļ���(<input type="text" />��)
    if (fileItem == null || fileItem.isFormField()) {
     continue;
    }
    // �õ��ļ�������·��
    path = fileItem.getName();
    // �õ��ļ��Ĵ�С
    size = fileItem.getSize();
    if ("".equals(path) || size == 0) {
     out.println("��ѡ���ϴ��ļ�<p />");
     out.println("<a href=\"upload.html\" target=\"_top\">����</a>");
     return;
    }

    // �õ�ȥ��·�����ļ���
    String t_name = path.substring(path.lastIndexOf("\\") + 1);
    // �õ��ļ�����չ��(����չ��ʱ���õ�ȫ��)
    String t_ext = t_name.substring(t_name.lastIndexOf(".") + 1);
    // �ܾ����ܹ涨�ļ���ʽ֮����ļ�����
    int allowFlag = 0;
    int allowedExtCount = allowedExt.length;
    for (; allowFlag < allowedExtCount; allowFlag++) {
     if (allowedExt[allowFlag].equals(t_ext))
      break;
    }
    if (allowFlag == allowedExtCount) {
     out.println("���ϴ��������͵��ļ�<p />");
     for (allowFlag = 0; allowFlag < allowedExtCount; allowFlag++)
      out.println("*." + allowedExt[allowFlag]
        + "&nbsp;&nbsp;&nbsp;");
     out.println("<p /><a href=\"upload.html\" target=\"_top\">����</a>");
     return;
    }

    long now = System.currentTimeMillis();
    // ����ϵͳʱ�������ϴ��󱣴���ļ���
    String prefix = String.valueOf(now);
    // ����������ļ�����·��,������web��Ŀ¼�µ�ImagesUploadedĿ¼��
    String u_name = request.getRealPath("/") + "ImagesUploaded"
      + t_name + "." + t_ext;
    try {
     // �����ļ�
     fileItem.write(new File(u_name));
     out.println("�ļ��ϴ��ɹ�. �ѱ���Ϊ: " + t_name + "." + t_ext
       + " &nbsp;&nbsp;�ļ���С: " + size + "�ֽ�<p />");
     //FileItemStream fis =(FileItemStream) fileItem;
     
     String savePath = "E:\\myworkspace\\ects_host\\WebRoot\\ImagesUploaded";
     saveDir = new File(savePath);
     BufferedInputStream in = new BufferedInputStream(((FileItemStream) fis).openStream());//����ļ�������
     BufferedOutputStream out2 = new BufferedOutputStream(new FileOutputStream(new File(saveDir+t_name	)));//����ļ������
     Streams.copy(in, out2, true);//��ʼ���ļ�д����ָ�����ϴ��ļ���

     out.println("<a href=\"addProperty.jsp\" target=\"_top\">����</a>");
    } catch (Exception e) {
     e.printStackTrace();
    }

   }
	
	 

}

public void init() throws ServletException {
	
	 String tmpPath = "E:\\myworkspace\\ects_host\\WebRoot\\ImagesUploaded";
     String savePath = "E:\\myworkspace\\ects_host\\WebRoot\\ImagesUploaded";
   tmpDir = new File(tmpPath);
   saveDir = new File(savePath);
   if(!tmpDir.isDirectory())
       tmpDir.mkdir();
   if(!saveDir.isDirectory())
       saveDir.mkdir();

   // Put your code here
}

}


*/



import java.io.BufferedInputStream; 
import java.io.BufferedOutputStream;
import java.io.File; 
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;  
import org.apache.commons.fileupload.DefaultFileItemFactory;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams; 

import cn.edu.xjtu.ects.dao.IProductDao;
import cn.edu.xjtu.ects.dao.IPropertyDao;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.entity.Property;
import cn.edu.xjtu.ects.impl.ProductDaoImpl;
import cn.edu.xjtu.ects.impl.PropertyDaoImpl;

 

public class UploadServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {  
 File tmpDir = null;//��ʼ���ϴ��ļ�����ʱ���Ŀ¼    
 File saveDir = null;//��ʼ���ϴ��ļ���ı���Ŀ¼  
 public UploadServlet() {      super();    }      
 
 
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {     
   doPost(request,response);    
   }    
  public void init() throws ServletException { 
   super.init();    
   String tmpPath = "E:\\apache-tomcat-6.0.18\\webapps\\ects\\ImagesUploaded";    
   String savePath = "E:\\myworkspace\\ects_final\\WebRoot\\ImagesUploaded";    
   tmpDir = new File(tmpPath);   
   saveDir = new File(savePath);  
   if(!tmpDir.isDirectory())      
    tmpDir.mkdir();    
   if(!saveDir.isDirectory())     
    saveDir.mkdir();       
   }   
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {     
   try{    
        if(ServletFileUpload.isMultipartContent(request)){ 
     DiskFileItemFactory dff = new DiskFileItemFactory();//�����ö���
     dff.setRepository(tmpDir);//ָ���ϴ��ļ�����ʱĿ¼
     dff.setSizeThreshold(1024000);//ָ�����ڴ��л������ݴ�С,��λΪbyte 
     ServletFileUpload sfu = new ServletFileUpload(dff);//�����ö���  
     sfu.setSizeMax(5000000);//ָ�������ϴ��ļ������ߴ�  
     sfu.setSizeMax(10000000);//ָ��һ���ϴ�����ļ����ܳߴ�  
     FileItemIterator fii = sfu.getItemIterator(request);
     
     String propertyName = null;
     while(fii.hasNext()){  
      
      FileItemStream fis = fii.next();//�Ӽ����л��һ���ļ��� 
      if(!fis.isFormField() && fis.getName().length()>0){
      
       String fileName = fis.getName().substring(fis.getName().lastIndexOf("\\")+1);//����ϴ��ļ����ļ��� 
      
       propertyName = fileName;
       BufferedInputStream in = new BufferedInputStream(fis.openStream());//����ļ�������
       BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File(saveDir+"\\"+fileName)));//����ļ������  
       Streams.copy(in, out, true);//��ʼ���ļ�д����ָ�����ϴ��ļ���  
      }
     }
     	
     	int productId = ((Product)request.getSession().getAttribute("product")).getProduct_id();
		IProductDao dao2 =new ProductDaoImpl();
		Product product = dao2.findById(productId);
		product.setImage(propertyName);
		dao2.update(product);
		System.out.println(product.getName());
		System.out.println(product.getProduct_id());

		request.getSession().setAttribute("product",product);
		
		//return mapping.findForward("addProperty2");
     
     response.getWriter().println("File upload successfully!!!");
     response.getWriter().println("<a href=\"addProperty.jsp\" target=\"_top\">����</a>");
    }
   }
   catch(Exception e){         
    e.printStackTrace();  
   }
  }
 
}

