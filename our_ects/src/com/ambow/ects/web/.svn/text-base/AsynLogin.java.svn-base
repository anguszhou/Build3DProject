package com.ambow.ects.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ambow.ecport.exception.ManagerUserException;
import com.ambow.ects.dao.IUserDao;
import com.ambow.ects.dao.impl.UserDaoHibernateImp;
import com.ambow.ects.entity.User;

public class AsynLogin extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String path = req.getServletPath();		
		if(path.equals("/login.AsynLogin"))
			login(req,resp);
		else if(path.equals("/testUserName.AsynLogin"))
			hasName(req,resp);		
		
	}


	private void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		User user = null;
		IUserDao dao = new UserDaoHibernateImp();
		String result = "";
		
		try {
			
			user = dao.login(req.getParameter("name"), req.getParameter("password"));
			
		} catch (ManagerUserException e) {
			
			e.printStackTrace();
		} 
		if(user != null){
			req.getSession().setAttribute("user", user);
			result = "true";
		}
		else
			result = "false";
		
		resp.setContentType("text");
		resp.getWriter().print(result);
		
	}


	private void hasName(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		List userList = null;
		IUserDao dao = new UserDaoHibernateImp();
		String result = "";
	
		try {
			
			userList = dao.login(req.getParameter("name"));
			
		} catch (ManagerUserException e) {
			
			e.printStackTrace();
		}	
		
		if(userList != null && userList.size()!=0)
			result = "false";		
		else
			result = "true";
		
		resp.setContentType("text");
		resp.getWriter().print(result);
		
	}

}
