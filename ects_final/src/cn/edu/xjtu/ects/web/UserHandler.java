package cn.edu.xjtu.ects.web;




import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;


import cn.edu.xjtu.ects.exception.ManagerUserException;
import cn.edu.xjtu.ects.dao.ICommentDao;
import cn.edu.xjtu.ects.dao.IProductDao;
import cn.edu.xjtu.ects.dao.ISellerDao;
import cn.edu.xjtu.ects.dao.IUserDao;
import cn.edu.xjtu.ects.impl.CommentDaoImpl;
import cn.edu.xjtu.ects.impl.ProductDaoImpl;
import cn.edu.xjtu.ects.impl.SellerDaoImpl;
import cn.edu.xjtu.ects.impl.UserDaoImpl;
import cn.edu.xjtu.ects.util.PageController;
import cn.edu.xjtu.ects.entity.ContactInfo;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.entity.User;
import cn.edu.xjtu.ects.entity.Admin;


public class UserHandler extends MappingDispatchAction {
		
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IUserDao dao  = new UserDaoImpl();
		User user = null;
		
		try {			
			user = dao.login(req.getParameter("name"), req.getParameter("password"));						
			
		} catch (ManagerUserException e) {
			
			e.printStackTrace();
		}
		if(user != null)
		{
			req.getSession().setAttribute("user", user);
			String role = req.getParameter("role");
			if (role.equals("1")){
				return mapping.findForward("index");
			}
			return mapping.findForward("index2");
		}
		else
		{
			req.setAttribute("message", "用户名或密码有误，请重新登录！");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}		
	}
	
	public ActionForward loginadmin(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IUserDao dao  = new UserDaoImpl();
		Admin admin = null;
		
		try {				
			admin = dao.loginadmin(req.getParameter("name"), req.getParameter("password"));
		} catch (ManagerUserException e) {
			
			e.printStackTrace();
		}
		if(admin != null)
		{
			req.getSession().setAttribute("admin", admin);			
			return mapping.findForward("index");
		}
		else
		{
			req.setAttribute("message", "用户名或密码有误，请重新登录！");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}		
	}

	public ActionForward logout(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		req.getSession().invalidate();
		
		return mapping.findForward("index");
	}

	public ActionForward regist(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IUserDao dao = new UserDaoImpl();
		User user = new User();
		
		user.setName(req.getParameter("name"));
		user.setPasswd(req.getParameter("password"));
		
		ContactInfo info = new ContactInfo();
		info.setCellPhone(req.getParameter("cellPhone"));
		info.setEmail(req.getParameter("email"));
		info.setAddress(req.getParameter("address"));	
		
		user.setContcatInfo(info);
		info.setUser(user);	
		
		try {
			
			dao.add(user);
			
		} catch (ManagerUserException e) {
			
			e.printStackTrace();
			req.setAttribute("message", "抱歉，注册失败！");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}

		req.getSession().setAttribute("user", user);
			
		req.getSession(true).setAttribute("user",user);	
		req.setAttribute("message", "恭喜，注册成功！");
		req.setAttribute("success", true);
		
		return mapping.findForward("success");
		
		
		
	}


	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IUserDao dao = new UserDaoImpl();
		User user = (User)req.getSession().getAttribute("user");
		
		user.setName(req.getParameter("name"));
		user.setPasswd(req.getParameter("password"));
		user.setId(user.getId());
		
		ContactInfo info = new ContactInfo();
		info.setId(user.getContcatInfo().getId());
		info.setCellPhone(req.getParameter("cellPhone"));
		info.setEmail(req.getParameter("email"));
		info.setAddress(req.getParameter("address"));
		

		
		user.setContcatInfo(info);
		info.setUser(user);	
		
		try {
			
			dao.update(user);
			
		} catch (ManagerUserException e) {
			e.printStackTrace();
			req.setAttribute("message", "抱歉，信息修改失败！");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}

		req.getSession().setAttribute("user", user);
		
		req.getSession(true).setAttribute("user",user);	
		req.setAttribute("message", "恭喜，信息修改成功！");
		req.setAttribute("success", true);
				
		return mapping.findForward("success");
	}
	
	public ActionForward goToAccount(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		
		return mapping.findForward("account");
	}	
	
	
	public ActionForward deleteUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {		
		int userId = Integer.parseInt(req.getParameter("userId"));
		IUserDao dao = new UserDaoImpl();
		User user = dao.findById(userId);
		dao.delete(user);
		
		return mapping.findForward("userList");
	}
	
	public ActionForward userList(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		IUserDao dao = new UserDaoImpl();
		//获取分页控制器
		PageController pc =(PageController) req.getSession().getAttribute("pageControl");
		if(pc == null)
		{			
			pc = new PageController(dao.getTotal(),1,6);
			req.getSession().setAttribute("pageController", pc);
		}
		
		//目标页ID
		int destPage = 1;
		String strDestPage = req.getParameter("destId");
		if(strDestPage != null && !strDestPage.equals(""))
			destPage = Integer.parseInt(strDestPage);		
		pc.setPageController(pc.getTotalRowsAmount(), destPage);
		
		//以下代码中只需要修改dao调用的函数即可
		pc.setData(dao.find((destPage-1)*pc.getPageSize(), pc.getPageSize()));
		
		//构造分页选择器
		StringBuffer selector = new StringBuffer();
		int start = destPage>=6?destPage-5:1;
		int end = destPage+5>=pc.getTotalPages()?pc.getTotalPages():destPage+5;
		for (int i=start;i<destPage;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		selector.append("<option selected='selected'>").append(destPage).append("</option>");
		for (int i=destPage+1;i<=end;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		
		req.setAttribute("pageSelector",selector.toString() );
		Collection<User> ten = pc.getData();
		for(User i : ten)
		{
			System.out.println(i.getName());
		}
		return mapping.findForward("userList");
	}
	
	public ActionForward userDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		int userId = Integer.parseInt(req.getParameter("userId"));		
		
		
		req.setAttribute("userDetail", new UserDaoImpl().findById(userId));
				
		return mapping.findForward("userDetail");
	}	
	public ActionForward sellerDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		int sellerId = Integer.parseInt(req.getParameter("sellerId"));		
		ISellerDao dao = new SellerDaoImpl();
		
		req.setAttribute("sellerDetail",dao.findById(sellerId) );
				
		return mapping.findForward("sellDetail");
	}	

}
