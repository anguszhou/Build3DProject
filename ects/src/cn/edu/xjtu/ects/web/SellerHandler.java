package cn.edu.xjtu.ects.web;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;


import cn.edu.xjtu.ects.exception.ManagerUserException;
import cn.edu.xjtu.ects.dao.IProductClassDao;
import cn.edu.xjtu.ects.dao.IProductDao;
import cn.edu.xjtu.ects.dao.ISellerDao;
import cn.edu.xjtu.ects.dao.IUserDao;
import cn.edu.xjtu.ects.impl.ProductClassDaoImpl;
import cn.edu.xjtu.ects.impl.ProductDaoImpl;
import cn.edu.xjtu.ects.impl.SellerDaoImpl;
import cn.edu.xjtu.ects.impl.UserDaoImpl;
import cn.edu.xjtu.ects.util.PageController;
import cn.edu.xjtu.ects.entity.Category;
import cn.edu.xjtu.ects.entity.ContactInfo;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.entity.ProductClass;
import cn.edu.xjtu.ects.entity.Seller;
import cn.edu.xjtu.ects.entity.User;


public class SellerHandler extends MappingDispatchAction {
		
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
			req.getSession().setAttribute("seller", user);
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
		/*IUserDao dao = new UserDaoImpl();
		User user = new User();*/
		
		ISellerDao dao = new SellerDaoImpl();
		Seller seller = new Seller(req.getParameter("name"),req.getParameter("password"));
		
		seller.setRealName(req.getParameter("realName"));
		seller.setShopName(req.getParameter("setShopName"));
		seller.setShopDescriptions(req.getParameter("setShopDescriptions"));
		//user.setId(Integer.parseInt(req.getParameter("user_id")));
		
		ContactInfo info = new ContactInfo();
		//info.setId(Integer.parseInt(req.getParameter("info_id")));
		info.setCellPhone(req.getParameter("cellPhone"));
		info.setEmail(req.getParameter("email"));
		info.setAddress(req.getParameter("address"));	
		
		seller.setContcatInfo(info);
		info.setUser(seller);	
		
		try {
			
			dao.add(seller);
			
		} catch (ManagerUserException e) {
			
			e.printStackTrace();
			req.setAttribute("message", "抱歉，注册失败！");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}

		req.getSession().setAttribute("user", seller);
		
		req.getSession(true).setAttribute("user",seller);	
		req.setAttribute("message", "恭喜，注册成功！");
		req.setAttribute("success", true);
				
		return mapping.findForward("success");
	}


	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		ISellerDao dao = new SellerDaoImpl();
		Seller seller = (Seller)req.getSession().getAttribute("seller");
		
		seller.setName(req.getParameter("name"));
		seller.setPasswd(req.getParameter("password"));
		seller.setId(seller.getid());
		
		ContactInfo info = new ContactInfo();
		info.setId(seller.getContcatInfo().getId());
		info.setCellPhone(req.getParameter("cellPhone"));
		info.setEmail(req.getParameter("email"));
		info.setAddress(req.getParameter("address"));
		

		
		seller.setContcatInfo(info);
		info.setUser(seller);	
		
		try {
			
			dao.update(seller);
			
		} catch (ManagerUserException e) {
			e.printStackTrace();
			req.setAttribute("message", "抱歉，信息修改失败！");
			req.setAttribute("success", false);
			return mapping.findForward("success");
		}

		req.getSession().setAttribute("user", seller);
		
		req.getSession(true).setAttribute("user",seller);	
		req.setAttribute("message", "恭喜，信息修改成功！");
		req.setAttribute("success", true);
				
		return mapping.findForward("success");
	}
	
	public ActionForward showSellers(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
	
		ISellerDao dao = new SellerDaoImpl();
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
		Collection<Seller> ten = pc.getData();
		for(Seller i : ten)
		{
			System.out.println(i.getName());
		}
		return mapping.findForward("showsellers");
	}
	
	public ActionForward sellerDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		int sellerId = Integer.parseInt(req.getParameter("sellerId"));		
		
		
		req.setAttribute("sellerDetail", new SellerDaoImpl().findById(sellerId));
				
		return mapping.findForward("sellerDetail");
	}	
	
	public ActionForward goToAccount(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		
		return mapping.findForward("account");
	}	
	
	public ActionForward listBySellerId(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IProductDao dao = new ProductDaoImpl();
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
		
		//以下代码中只需要修改dao调用的函数即可
		int sellerId = Integer.parseInt(req.getParameter("sellerId"));
		Collection<Product> data = dao.findBySellerId(0, 100000000,14);
		if(data.size()==0)
		{
			System.out.println("sdfsdfsdfsdf");
		}
		req.setAttribute("sellerId",sellerId);
		if(data == null)
			pc.setPageController(0, destPage);
		else
			pc.setPageController(data.size(), destPage);
		
		int fromIndex = (destPage-1)*pc.getPageSize();
		int toIndex = destPage*pc.getPageSize()>=data.size()?data.size():destPage*pc.getPageSize();
		pc.setData(((List)data).subList(fromIndex, toIndex));
		//构造分页选择器
		StringBuffer selector = new StringBuffer();
		int start = destPage>=6?destPage-5:1;
		int end = destPage+5>=pc.getTotalPages()?pc.getTotalPages():destPage+5;
		for (int i=start;i<destPage;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		selector.append("<option selected='selected'>").append(destPage).append("</option>");
		for (int i=destPage+1;i<=end;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		
		req.setAttribute("pageSelector",selector.toString());
		
		for (Product i :data)
		{
			System.out.println(i.getName());
		}
		
		return mapping.findForward("sellerProductList");
		
	}
	
	public ActionForward addSellerProduct(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		Category category = new Category();
		String categoryName = (String) req.getSession().getAttribute("categoryName");
		category = category.findByName(categoryName);
		
		IProductClassDao pc = new ProductClassDaoImpl();
		ProductClass productClass = new ProductClass();
		String productClassName = (String)req.getSession().getAttribute("productClassName");
		productClass = pc.findByName(productClassName);
		productClass.setCategory(category);
		
		IProductDao pd = new ProductDaoImpl();
		Product product = new Product();		
		product.setName((String)req.getSession().getAttribute("productName"));
		product.setPrice(Double.parseDouble((String) req.getSession().getAttribute("productPrice")));
		String time = (String)req.getSession().getAttribute("productTime");
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date productTime = (Date)format.parse(time);
		
		product.setTime(productTime);
	    product.setProductClass(productClass);
	    
	    Seller seller = (Seller)req.getSession().getAttribute("seller");
	    product.setSeller(seller);
	    
	    pd.addProduct(product);
	    req.setAttribute("product", product);
		System.out.println(product.getProductClass().getCategory().getName());
		System.out.println(product.getProductClass().getCategory().getName());
		return mapping.findForward("addSellerProduct");
	}

}
