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

	
	 File tmpDir = null;//初始化上传文件的临时存放目录
	 File saveDir = null;//初始化上传文件后的保存目录

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
   final long MAX_SIZE = 3 * 1024 * 1024;// 设置上传文件最大为 3M
   // 允许上传的文件格式的列表
   final String[] allowedExt = new String[] { "jpg", "jpeg", "gif", "txt",
     "doc", "docx", "mp3", "wma", "m4a" };
   response.setContentType("text/html");
   // 设置字符编码为UTF-8, 这样支持汉字显示
   response.setCharacterEncoding("GBK");

   // 实例化一个硬盘文件工厂,用来配置上传组件ServletFileUpload
   DiskFileItemFactory dfif = new DiskFileItemFactory();
   dfif.setSizeThreshold(4096);// 设置上传文件时用于临时存放文件的内存大小,这里是4K.多于的部分将临时存在硬盘
   
   dfif.setRepository(new File(request.getRealPath("/")   	   
     + "ImagesUploaded"));// 设置存放临时文件的目录,web根目录下的ImagesUploaded目录

   // 用以上工厂实例化上传组件
   ServletFileUpload sfu = new ServletFileUpload(dfif);
   // 设置最大上传尺寸
   sfu.setSizeMax(MAX_SIZE);

   PrintWriter out = response.getWriter();
   // 从request得到 所有 上传域的列表
   List fileList = null;
   try {
    fileList = sfu.parseRequest(request);
   } catch (FileUploadException e) {// 处理文件尺寸过大异常
    if (e instanceof SizeLimitExceededException) {
     out.println("文件尺寸超过规定大小:" + MAX_SIZE + "字节<p />");
     out.println("<a href=\"upload.html\" target=\"_top\">返回</a>");
     return;
    }
    e.printStackTrace();
   }
   // 没有文件上传
   if (fileList == null || fileList.size() == 0) {
    out.println("请选择上传文件<p />");
    out.println("<a href=\"upload.html\" target=\"_top\">返回</a>");
    return;
   }
   // 得到所有上传的文件
   Iterator fileItr = fileList.iterator();
   int i=0;
   // 循环处理所有文件
   while (fileItr.hasNext()) {
    FileItem fileItem = null;
    String path = null;
    long size = 0;
    // 得到当前文件
    fileItem = (FileItem) fileItr.next();
   //FileItem fis = fileItem;
    i++;
    // 忽略简单form字段而不是上传域的文件域(<input type="text" />等)
    if (fileItem == null || fileItem.isFormField()) {
     continue;
    }
    // 得到文件的完整路径
    path = fileItem.getName();
    // 得到文件的大小
    size = fileItem.getSize();
    if ("".equals(path) || size == 0) {
     out.println("请选择上传文件<p />");
     out.println("<a href=\"upload.html\" target=\"_top\">返回</a>");
     return;
    }

    // 得到去除路径的文件名
    String t_name = path.substring(path.lastIndexOf("\\") + 1);
    // 得到文件的扩展名(无扩展名时将得到全名)
    String t_ext = t_name.substring(t_name.lastIndexOf(".") + 1);
    // 拒绝接受规定文件格式之外的文件类型
    int allowFlag = 0;
    int allowedExtCount = allowedExt.length;
    for (; allowFlag < allowedExtCount; allowFlag++) {
     if (allowedExt[allowFlag].equals(t_ext))
      break;
    }
    if (allowFlag == allowedExtCount) {
     out.println("请上传以下类型的文件<p />");
     for (allowFlag = 0; allowFlag < allowedExtCount; allowFlag++)
      out.println("*." + allowedExt[allowFlag]
        + "&nbsp;&nbsp;&nbsp;");
     out.println("<p /><a href=\"upload.html\" target=\"_top\">返回</a>");
     return;
    }

    long now = System.currentTimeMillis();
    // 根据系统时间生成上传后保存的文件名
    String prefix = String.valueOf(now);
    // 保存的最终文件完整路径,保存在web根目录下的ImagesUploaded目录下
    String u_name = request.getRealPath("/") + "ImagesUploaded"
      + t_name + "." + t_ext;
    try {
     // 保存文件
     fileItem.write(new File(u_name));
     out.println("文件上传成功. 已保存为: " + t_name + "." + t_ext
       + " &nbsp;&nbsp;文件大小: " + size + "字节<p />");
     //FileItemStream fis =(FileItemStream) fileItem;
     
     String savePath = "E:\\myworkspace\\ects_host\\WebRoot\\ImagesUploaded";
     saveDir = new File(savePath);
     BufferedInputStream in = new BufferedInputStream(((FileItemStream) fis).openStream());//获得文件输入流
     BufferedOutputStream out2 = new BufferedOutputStream(new FileOutputStream(new File(saveDir+t_name	)));//获得文件输出流
     Streams.copy(in, out2, true);//开始把文件写到你指定的上传文件夹

     out.println("<a href=\"addProperty.jsp\" target=\"_top\">返回</a>");
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
 File tmpDir = null;//初始化上传文件的临时存放目录    
 File saveDir = null;//初始化上传文件后的保存目录  
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
     DiskFileItemFactory dff = new DiskFileItemFactory();//创建该对象
     dff.setRepository(tmpDir);//指定上传文件的临时目录
     dff.setSizeThreshold(1024000);//指定在内存中缓存数据大小,单位为byte 
     ServletFileUpload sfu = new ServletFileUpload(dff);//创建该对象  
     sfu.setSizeMax(5000000);//指定单个上传文件的最大尺寸  
     sfu.setSizeMax(10000000);//指定一次上传多个文件的总尺寸  
     FileItemIterator fii = sfu.getItemIterator(request);
     
     String propertyName = null;
     while(fii.hasNext()){  
      
      FileItemStream fis = fii.next();//从集合中获得一个文件流 
      if(!fis.isFormField() && fis.getName().length()>0){
      
       String fileName = fis.getName().substring(fis.getName().lastIndexOf("\\")+1);//获得上传文件的文件名 
      
       propertyName = fileName;
       BufferedInputStream in = new BufferedInputStream(fis.openStream());//获得文件输入流
       BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File(saveDir+"\\"+fileName)));//获得文件输出流  
       Streams.copy(in, out, true);//开始把文件写到你指定的上传文件夹  
      }
     }
     	
     	int productId = ((Product)request.getSession().getAttribute("product")).getProduct_id();
		IProductDao dao2 =new ProductDaoImpl();
		Product product = dao2.findById(productId);
		System.out.println(product.getName());
		System.out.println(product.getProduct_id());
		
		
		
		IPropertyDao dao = new PropertyDaoImpl();
		Property pro = new Property() ;
		if(dao.findByName("图片名",productId)==null)
		{			
			pro.setProduct(product);
			pro.setPropertyName("图片名");
			pro.setPropertyValue(propertyName);
			dao.addProperty(pro);
		}
		else{
		 pro = dao.findByName("图片名",productId);
		 pro.setProduct(product);
		 pro.setPropertyValue(propertyName);
		 dao.update(pro);
		}
		
		
		Collection<Property>propertys = product.getPropertys();
		propertys.add(pro);
		request.getSession().setAttribute("product",product);
		request.getSession().setAttribute("propertys", propertys);
		//return mapping.findForward("addProperty2");
     
     response.getWriter().println("File upload successfully!!!");
     response.getWriter().println("<a href=\"addProperty.jsp\" target=\"_top\">返回</a>");
    }
   }
   catch(Exception e){         
    e.printStackTrace();  
   }
  }
 
}

