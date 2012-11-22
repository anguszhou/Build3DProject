package xjtu.citi.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xjtu.citi.entity.*;

public class LoginFilter extends HttpServlet implements  Filter{

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
    	BankUser  login_type = (BankUser) session.getAttribute("user");
        if(login_type != null){
        chain.doFilter(request, response);
        }else{
             res.sendRedirect(req.getContextPath()
     					+ "/login.jsp");
        }
        CompanyUser  login_type1 = (CompanyUser) session.getAttribute("user");
        if(login_type1 != null){
        chain.doFilter(request, response);
        }else{
                 res.sendRedirect(req.getContextPath()
     					+ "/login.jsp");
        }
    }

    @Override
	public void destroy()
    {
        this.config = null;
    }
}
