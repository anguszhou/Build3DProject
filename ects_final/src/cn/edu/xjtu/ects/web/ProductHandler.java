package cn.edu.xjtu.ects.web;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;


import cn.edu.xjtu.ects.dao.ICommentDao;
import cn.edu.xjtu.ects.dao.IProductDao;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.impl.CommentDaoImpl;
import cn.edu.xjtu.ects.impl.ProductDaoImpl;
import cn.edu.xjtu.ects.util.PageController;



public class ProductHandler extends MappingDispatchAction{

	public ActionForward home(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception
	{		
		IProductDao dao = new ProductDaoImpl();
		Collection promotedProduct = dao.findAll();
		req.getSession().setAttribute("promotedProduct", promotedProduct);
		req.setAttribute("first", false);
		return mapping.findForward("index");

	}
	public ActionForward findByproductClass(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		
		IProductDao dao = new ProductDaoImpl();
		//��ȡ��ҳ������
		PageController pc =(PageController) req.getSession().getAttribute("pageControl");
		if(pc == null)
		{			
			pc = new PageController(dao.getTotal(),1,6);
			req.getSession().setAttribute("pageController", pc);
		}	
		
		//Ŀ��ҳID
		int destPage = 1;
		String strDestPage = req.getParameter("destId");
		if(strDestPage != null && !strDestPage.equals(""))
			destPage = Integer.parseInt(strDestPage);
		
		//���´�����ֻ��Ҫ�޸�dao���õĺ�������
		int id = Integer.parseInt(req.getParameter("productClass_id"));
		Collection data = dao.findByProductClass(0, 100000000,id);
		req.setAttribute("productClass_id", id);
		if(data == null)
			pc.setPageController(0, destPage);
		else
			pc.setPageController(data.size(), destPage);
		
		int fromIndex = (destPage-1)*pc.getPageSize();
		int toIndex = destPage*pc.getPageSize()>=data.size()?data.size():destPage*pc.getPageSize();
		pc.setData(((List)data).subList(fromIndex, toIndex));
		//�����ҳѡ����
		StringBuffer selector = new StringBuffer();
		int start = destPage>=6?destPage-5:1;
		int end = destPage+5>=pc.getTotalPages()?pc.getTotalPages():destPage+5;
		for (int i=start;i<destPage;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		selector.append("<option selected='selected'>").append(destPage).append("</option>");
		for (int i=destPage+1;i<=end;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		
		req.setAttribute("pageSelector",selector.toString());
		System.out.println("test!!!!!");
		
		return mapping.findForward("productClassList");
	}
	
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		IProductDao dao = new ProductDaoImpl();
		//��ȡ��ҳ������
		PageController pc =(PageController) req.getSession().getAttribute("pageControl");
		if(pc == null)
		{			
			pc = new PageController(dao.getTotal(),1,6);
			req.getSession().setAttribute("pageController", pc);
		}
		
		//Ŀ��ҳID
		int destPage = 1;
		String strDestPage = req.getParameter("destId");
		if(strDestPage != null && !strDestPage.equals(""))
			destPage = Integer.parseInt(strDestPage);		
		pc.setPageController(pc.getTotalRowsAmount(), destPage);
		
		//���´�����ֻ��Ҫ�޸�dao���õĺ�������
		pc.setData(dao.find((destPage-1)*pc.getPageSize(), pc.getPageSize()));
		
		//�����ҳѡ����
		StringBuffer selector = new StringBuffer();
		int start = destPage>=6?destPage-5:1;
		int end = destPage+5>=pc.getTotalPages()?pc.getTotalPages():destPage+5;
		for (int i=start;i<destPage;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		selector.append("<option selected='selected'>").append(destPage).append("</option>");
		for (int i=destPage+1;i<=end;i++)		
			selector.append("<option value='").append(i).append("'>").append(i).append("</option>");
		
		req.setAttribute("pageSelector",selector.toString() );
		Collection<Product> ten = pc.getData();
		for(Product i : ten)
		{
			System.out.println(i.getName());
		}
		return mapping.findForward("List");
	}
	
	public ActionForward detail(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		int productId = Integer.parseInt(req.getParameter("productId"));
		ICommentDao dao = new CommentDaoImpl();
		List commentList;
		
		try
		{
			commentList = (List) dao.findByProduct_id(productId);
			req.setAttribute("commentList", commentList);
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		req.setAttribute("productDetail", new ProductDaoImpl().findById(productId));
				
		return mapping.findForward("detail");
	}	
}
