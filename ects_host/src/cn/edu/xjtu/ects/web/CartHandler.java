package cn.edu.xjtu.ects.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

import cn.edu.xjtu.ects.entity.OrderLine;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.entity.ShopCart;
import cn.edu.xjtu.ects.impl.ProductDaoImpl;
import cn.edu.xjtu.ects.exception.ManagerProductException;



public class CartHandler extends MappingDispatchAction {

	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		ShopCart cart =(ShopCart)req.getSession().getAttribute("cart");
		if(cart == null)
		{
			cart = new ShopCart();
			req.getSession().setAttribute("cart", cart);
			
		}
		
		try {
			
			Product pro = new ProductDaoImpl().findById(Integer.parseInt(req.getParameter("productId")));
			OrderLine orderLine = new OrderLine();
			
			orderLine.setAmount(1);			
			orderLine.setProduct(pro);
			cart.add(orderLine);			
			
		} catch (NumberFormatException e) {
			
			e.printStackTrace();
			
		} catch (ManagerProductException e) {
			
			e.printStackTrace();
		}
		
		//–ﬁ∏ƒ‰Ø¿¿∆˜µÿ÷∑¿∏£¨∑¿÷π÷ÿ∏¥Ã·Ωª
		response.sendRedirect("cart.jsp");		
		//return mapping.findForward("cart");
		return null;
	}
	
	public ActionForward clear(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		ShopCart cart =(ShopCart)req.getSession().getAttribute("cart");
		if(cart == null)
		{
			cart = new ShopCart();
			req.getSession().setAttribute("cart", cart);
			
		}
		cart.clearCart();
		
		return mapping.findForward("cart");
	}
	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		ShopCart cart =(ShopCart)req.getSession().getAttribute("cart");
		if(cart == null)
		{
			cart = new ShopCart();
			req.getSession().setAttribute("cart", cart);
			
		}
		OrderLine line = new OrderLine();
		try {
			
			Product pro = new ProductDaoImpl().findById(Integer.parseInt(req.getParameter("productId")));
			line.setProduct(pro);
			line.setAmount(Integer.parseInt(req.getParameter("num")));
			cart.modify(line);
			
		} catch (NumberFormatException e) {
			
			e.printStackTrace();
		} catch (ManagerProductException e) {
			
			e.printStackTrace();
		}
		
		return mapping.findForward("cart");
	}
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		ShopCart cart =(ShopCart)req.getSession().getAttribute("cart");
		if(cart == null)
		{
			cart = new ShopCart();
			req.getSession().setAttribute("cart", cart);
			
		}
		cart.remove(Integer.parseInt(req.getParameter("productId")));
		
		return mapping.findForward("cart");
	}
	
	public ActionForward add1(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		
		ShopCart cart =(ShopCart)req.getSession().getAttribute("cart");
		String action = req.getParameter("action");
		
		if(cart == null)
		{
			cart = new ShopCart();
			req.getSession().setAttribute("cart", cart);
			
		}
		
		try {
			
			Product pro = new ProductDaoImpl().findById(Integer.parseInt(req.getParameter("productId")));
			System.out.println(pro.getName());
			OrderLine orderLine = new OrderLine();			
			orderLine.setAmount(1);			
			orderLine.setProduct(pro);
			cart.add(orderLine);			
			
		} catch (NumberFormatException e) {
			
			e.printStackTrace();
			
		} catch (ManagerProductException e) {
			
			e.printStackTrace();
		}
				
		return mapping.findForward("productList");
		//response.sendRedirect("productList.jsp");
		//return null;
		
	}
	
	public ActionForward delete1(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		//System.out.println("+++++++++++");
		ShopCart cart =(ShopCart)req.getSession().getAttribute("cart");
		if(cart == null)
		{
			cart = new ShopCart();
			req.getSession().setAttribute("cart", cart);
			
		}
		cart.remove(Integer.parseInt(req.getParameter("productId")));
		
		//return mapping.findForward("cart1");
		return mapping.findForward("productList.jsp");
	}
}
