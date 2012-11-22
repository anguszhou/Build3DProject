package cn.edu.xjtu.ects.util;
/**
 * @author xubin
 * @date 2007-3-16
 * @version xb1.0
 * @description 用于字符转码的工具过滤器类
 */

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter{
	
	protected FilterConfig config;

    public void init(FilterConfig config)
    {
        this.config = config;
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
            ServletException
    {
       
        response.setCharacterEncoding("gbk");
        request.setCharacterEncoding("gbk");
        chain.doFilter(request, response);
    }

    public void destroy()
    {
        this.config = null;
    }
}
