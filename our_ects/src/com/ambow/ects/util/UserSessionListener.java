package com.ambow.ects.util;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.ambow.ects.entity.ShopCart;




public class UserSessionListener implements HttpSessionListener{

	public void sessionCreated(HttpSessionEvent event) {
		System.out.println(" һ�����û�����ϵͳ.....");
		HttpSession session =  event.getSession();
		ShopCart  cart = new ShopCart();
		session.setAttribute("cart", cart );
		System.out.println(" ���ﳵ�Ѿ������û��Ự,������������.....");
		this.addOnLine(session);		
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		this.removeOnLine(session);
		System.out.println("һ�����û������˳����Ϲ���ϵͳ!");
	}
	private synchronized void addOnLine(HttpSession session) {
		ServletContext context = session.getServletContext();
		Integer online_count = (Integer) context.getAttribute("online_count");
		Integer  history_count = (Integer)context.getAttribute("history_count");
		online_count = new Integer(online_count.intValue() + 1);
		history_count = new Integer(history_count.intValue() + 1);
		context.setAttribute("history_count", history_count);
		context.setAttribute("online_count", online_count);
	}

	private synchronized void removeOnLine(HttpSession session) {
		ServletContext context = session.getServletContext();
		Integer online_count = (Integer) context.getAttribute("online_count");
		online_count = new Integer(online_count.intValue() - 1);
		context.setAttribute("online_count", online_count);
	}
}
