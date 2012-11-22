package com.ambow.ects.web;


import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import org.hibernate.Query;
import org.hibernate.Session;

import com.ambow.ects.dao.ICommentDao;
import com.ambow.ects.dao.IProductDao;
import com.ambow.ects.dao.impl.CommentDaoImp;
import com.ambow.ects.dao.impl.ProductDaoImp;
import com.ambow.ects.entity.Category;
import com.ambow.ects.entity.Product;
import com.ambow.ects.util.HibernateUtils;
import com.ambow.ects.util.PageController;

public class ProductHandler extends MappingDispatchAction  {
	
	public ActionForward home(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		//排行逼哥
		IProductDao dao = new ProductDaoImp();
		Collection rankProduct = dao.rankProduct();
		req.getSession().setAttribute("rankProduct", rankProduct);
		
		//排行笔记本品牌
		IProductDao daoCategory = new ProductDaoImp();
		Collection rankCategory = daoCategory.hotCategory();
		req.getSession().setAttribute("rankCategory", rankCategory);

		//推荐商品
		Collection promotedProduct = dao.findByPromoted();
		req.getSession().setAttribute("promotedProduct", promotedProduct);
		
		//打折商品
		Collection discProduct = dao.findByDiscount();
		req.getSession().setAttribute("discProduct", discProduct);		
		
		
		//新货上市
		Collection newProduct = dao.findByTime();
		req.getSession().setAttribute("newProduct", newProduct);

		//此行不能少
		req.setAttribute("first", false);
		return mapping.findForward("index");
	}
	
	public ActionForward detail(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		int productId = Integer.parseInt(req.getParameter("productId"));
		ICommentDao dao = new CommentDaoImp();
		List commentList;
		
		try
		{
			commentList = (List) dao.findByProductId(productId);
			req.setAttribute("commentList", commentList);
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		req.setAttribute("productDetail", new ProductDaoImp().findById(productId));
				
		return mapping.findForward("detail");
	}	
	
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		IProductDao dao = new ProductDaoImp();
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
		
		return mapping.findForward("List");
	}
	

	public ActionForward special(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		ActionForward forward = null;
		IProductDao dao = new ProductDaoImp();
		//获取分页控制器
		PageController pc =(PageController) req.getSession().getAttribute("pageController");
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
		Collection data = dao.findByDiscount(0, 10000000);
		
		if(data == null)
			pc.setPageController(0, destPage);
		else
			pc.setPageController(data.size(), destPage);
		
		//以下代码中只需要修改dao调用的函数即可
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
		
		req.setAttribute("pageSelector",selector.toString() );
		forward = mapping.findForward("special");
		
		return forward;
	}
	
	public ActionForward newProduct(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		ActionForward forward = null;
		IProductDao dao = new ProductDaoImp();
		//获取分页控制器
		PageController pc =(PageController) req.getSession().getAttribute("pageController");
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
		Collection data = dao.findByTime(0, 10000000);
		
		if(data == null)
			pc.setPageController(0, destPage);
		else
			pc.setPageController(data.size(), destPage);
		
		//以下代码中只需要修改dao调用的函数即可
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
		
		req.setAttribute("pageSelector",selector.toString() );
		forward = mapping.findForward("newProduct");
		
		return forward;
	}
	
	public ActionForward promotedProduct(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		ActionForward forward = null;
		IProductDao dao = new ProductDaoImp();
		//获取分页控制器
		PageController pc =(PageController) req.getSession().getAttribute("pageController");
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
		Collection data = dao.findByPromoted(0, 100000000);
		
		if(data == null)
			pc.setPageController(0, destPage);
		else
			pc.setPageController(data.size(), destPage);
		
		//以下代码中只需要修改dao调用的函数即可
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
		
		req.setAttribute("pageSelector",selector.toString() );
		forward = mapping.findForward("promotedProduct");
		
		return forward;
	}


	public ActionForward findByCategory(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		IProductDao dao = new ProductDaoImp();
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
		int id = Integer.parseInt(req.getParameter("categoryId"));
		Collection data = dao.findByCategory(0, 100000000,id);
		req.setAttribute("categoryId", id);
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
		
		return mapping.findForward("categoryList");
	}

	
	public ActionForward findByPrice(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		IProductDao dao = new ProductDaoImp();
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
		int low = Integer.parseInt(req.getParameter("low"));
		int high = Integer.parseInt(req.getParameter("high"));
		Collection data = dao.findByPrice(0, 10000000,low,high);
		req.setAttribute("low", low);
		req.setAttribute("high", high);
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
		
		req.setAttribute("pageSelector",selector.toString() );
		
		return mapping.findForward("priceList");
	}
	
	public ActionForward findBySize(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		IProductDao dao = new ProductDaoImp();
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
		String size = req.getParameter("size");
		Collection data = dao.findBySize(0, 10000000,size);
		req.setAttribute("size", size);
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
		
		req.setAttribute("pageSelector",selector.toString() );
		
		return mapping.findForward("sizeList");
	}
	
	public ActionForward findByType(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		IProductDao dao = new ProductDaoImp();
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
		String type = req.getParameter("type");
		req.setAttribute("type", type);
		if(type.equals("1"))
			type = "全能学生本";
		else if(type.equals("2"))
			type = "时尚丽人本";
		else if(type.equals("3"))
			type = "沉稳商务本";
		else if(type.equals("4"))
			type = "游戏影音本";
		else if(type.equals("5"))
			type = "日常办公本";
		
		Collection data = dao.findByType(0, 100000000,type);
		
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
		
		req.setAttribute("pageSelector",selector.toString() );
		
		return mapping.findForward("typeList");
	}
	
	public ActionForward search(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {		
		
		IProductDao dao = new ProductDaoImp();
		
		//从页面获得参数
		String cateName = req.getParameter("category");
		String model = req.getParameter("model");
		String type = req.getParameter("type");
		String cpu = req.getParameter("cpu");
		String disk = req.getParameter("disk");
		String size = req.getParameter("size");
		double size1 = Double.parseDouble(size);
		String lo1 = req.getParameter("lo");
		double lo ;
		if (lo1 == null||"".equals(lo1)){
			lo = 1;
		}else
		lo = Double.parseDouble(lo1);
		
		String mo1 = req.getParameter("mo");
		double mo ;
		if (mo1 == null||"".equals(mo1)){
			mo = 1;
		}else
		mo = Double.parseDouble(mo1);
		
		String condition = "&category="+cateName+"&model="+model+"&type="+type+"&cpu="+cpu
							+"&disk="+disk+"&size="+size+"&lo="+lo+"&mo="+mo;
		req.setAttribute("condition", condition);	
		
		System.out.println("条件"+condition);
		
		
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
		Collection data = dao.find(cateName,model,type,cpu,disk, size1,lo,mo,0,10000000);
		
		if(data == null)
			pc.setPageController(0, destPage);
		else
			pc.setPageController(data.size(), destPage);
		
		System.out.println(destPage);
		System.out.println(data.size());
		System.out.println(destPage);
		int fromIndex = (destPage-1)*pc.getPageSize();
		int toIndex = destPage*pc.getPageSize()>=data.size()?data.size():destPage*pc.getPageSize();
		
		System.out.println(fromIndex);
		System.out.println(toIndex);
		
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
		
		req.setAttribute("pageSelector",selector.toString() );
		
		return mapping.findForward("searchList");
	}

}
