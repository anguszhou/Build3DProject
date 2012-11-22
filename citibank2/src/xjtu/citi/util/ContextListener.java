package xjtu.citi.util;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener
{

	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		Integer online = new Integer(0);
		context.setAttribute("online_count", online);
		Integer history_count  = this.read(context);
		context.setAttribute("history_count", history_count);
		
	}

	public void contextDestroyed(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		Integer num = (Integer) context.getAttribute("history_count");
		this.save(num, context);
	}
	private Integer read(ServletContext context) {
		Integer num = new Integer(120);
		try {
			String str = context.getInitParameter("file");
			String path = context.getRealPath(str);
			System.out.println("==============path" + path);

			FileInputStream fin = new FileInputStream(path);
			DataInputStream din = new DataInputStream(fin);
			File f = new File(path);

			num = new Integer(din.readInt());
			din.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("系统初始化异常.....");
		} finally {
			return num;
		}

	}

	private void save(Integer num, ServletContext context) {
		try {
			String str = context.getInitParameter("file");
			String path = context.getRealPath(str);
			System.out.println("==============path" + path);
			FileOutputStream fin = new FileOutputStream(path);
			DataOutputStream din = new DataOutputStream(fin);
			din.writeInt(num.intValue());
			din.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("系统初始化异常.....");
		}
	}
}
