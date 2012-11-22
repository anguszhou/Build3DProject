package com.ambow.ects.web;

import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ambow.ecport.exception.ManagerUserException;
import com.ambow.ects.dao.IOrderDao;
import com.ambow.ects.dao.IProductDao;
import com.ambow.ects.dao.IUserDao;
import com.ambow.ects.dao.impl.OrderDaoHibernateImp;
import com.ambow.ects.dao.impl.ProductDaoImp;
import com.ambow.ects.dao.impl.UserDaoHibernateImp;
import com.ambow.ects.entity.ContcatInfo;
import com.ambow.ects.entity.Order;
import com.ambow.ects.entity.OrderLine;
import com.ambow.ects.entity.OrderStatus;
import com.ambow.ects.entity.PayWay;
import com.ambow.ects.entity.Product;
import com.ambow.ects.entity.ShopCart;
import com.ambow.ects.entity.User;
import com.ambow.ects.util.HibernateUtils;

public class OrderHandler extends MappingDispatchAction{
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IUserDao userDao = new UserDaoHibernateImp();
		IOrderDao orderDao = new OrderDaoHibernateImp();
		IProductDao proDao = new ProductDaoImp();
		
		//修改用户信息
		User user = (User)req.getSession().getAttribute("user");
		user.setName(req.getParameter("name"));
				
		ContcatInfo info = user.getInfo();		
		info.setCellPhone(req.getParameter("cellPhone"));
		info.setEmail(req.getParameter("email"));
		info.setHomePhone(req.getParameter("homePhone"));
		info.setOfficePhone(req.getParameter("officePhone"));
		info.setStreet1(req.getParameter("street1"));
		info.setStreet2(req.getParameter("street2"));		
		info.setZip(req.getParameter("zip"));	
		
		//添加order
		ShopCart cart =(ShopCart)req.getSession().getAttribute("cart");
		if(cart == null)
		{
			cart = new ShopCart();
			req.getSession().setAttribute("cart", cart);
			
		}
		Order order = cart.getOrder();
		order.setName(user.getName());
		
		
			
		int payWayId = Integer.parseInt(req.getParameter("payWayId"));
		order.setPayWay(getPayWay(payWayId));
		order.setStatus(getOrderStatus(1));
		order.setUser(user);
		Product product = new Product();
		
		//将orderLine绑定在order上，shopcart里面未实现
		for (Iterator iterator = order.getOrderlines().iterator(); iterator.hasNext();) {
			//((OrderLine) iterator.next()).setOrder(order);
			OrderLine line = (OrderLine) iterator.next();
			product = line.getProduct();
			product.setSaleVolume(line.getProduct().getSaleVolume()+line.getAmount());
			
			line.setOrder(order);
		}
				
		try {	
			proDao.update(product);
			userDao.update(user);
			orderDao.addOrder(order);
			
		} catch (ManagerUserException e) {
			
			e.printStackTrace();			
		}
		//获取orderList
		Collection orderList = orderDao.findAll(user.getName());
		cart.clearCart();
		
		req.setAttribute("orderList",orderList);
		return mapping.findForward("orderList");
	}
	
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {		
		
		IOrderDao orderDao = new OrderDaoHibernateImp();
		User user = (User)req.getSession().getAttribute("user");
		
		//获取orderList
		Collection orderList = orderDao.findAll(user.getName());
		
		
		req.setAttribute("orderList",orderList);
		return mapping.findForward("orderList");
	}
	
	
	public ActionForward detail(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {		
		
		IOrderDao orderDao = new OrderDaoHibernateImp();

		Order order = null;
		Integer orderId = Integer.parseInt(req.getParameter("orderId"));
		
		order = orderDao.findById(orderId);		
		req.setAttribute("order",order);
		
		return mapping.findForward("orderDetail");
	}
	private PayWay getPayWay(int Id){
		
		Session   session = null;
		Transaction  tran = null;
		PayWay  p = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			p = (PayWay) session.get( PayWay.class, Id);			
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
			return  p;
		}
	}
	
	private OrderStatus getOrderStatus(int Id){
		
		Session   session = null;
		Transaction  tran = null;
		OrderStatus  p = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			p = (OrderStatus) session.get( OrderStatus.class, Id);			
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
			return  p;
		}
	}

	
}
