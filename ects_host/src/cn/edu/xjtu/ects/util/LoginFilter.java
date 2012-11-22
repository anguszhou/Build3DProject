package cn.edu.xjtu.ects.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.xjtu.ects.entity.User;

public class LoginFilter implements  Filter{

	protected FilterConfig config;

    public void init(FilterConfig config)
    {
        this.config = config;
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
            ServletException
    {
    	HttpServletRequest  req = (HttpServletRequest)request;
    	HttpServletResponse  res = (HttpServletResponse)response;
    	HttpSession  session = req.getSession();
    	User  login_type = (User) session.getAttribute("user");
        if(login_type != null){
        chain.doFilter(request, response);
        }else{
                 res.sendRedirect(req.getContextPath()
     					+ "/login.jsp");
        }
    }

    public void destroy()
    {
        this.config = null;
    }
}
