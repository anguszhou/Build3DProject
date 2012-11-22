package cn.edu.xjtu.ects.web;

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

import cn.edu.xjtu.ects.util.HibernateUtils;

import cn.edu.xjtu.ects.dao.IOrderDao;
import cn.edu.xjtu.ects.dao.IOrderStatusDao;
import cn.edu.xjtu.ects.dao.IProductDao;
import cn.edu.xjtu.ects.dao.IUserDao;
import cn.edu.xjtu.ects.entity.ContactInfo;
import cn.edu.xjtu.ects.entity.Order;
import cn.edu.xjtu.ects.entity.OrderLine;
import cn.edu.xjtu.ects.entity.OrderStatus;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.entity.ShopCart;
import cn.edu.xjtu.ects.entity.User;
import cn.edu.xjtu.ects.exception.ManagerOrderStatusException;
import cn.edu.xjtu.ects.exception.ManagerUserException;
import cn.edu.xjtu.ects.impl.OrderDaoImpl;
import cn.edu.xjtu.ects.impl.OrderStatusDaoImpl;
import cn.edu.xjtu.ects.impl.ProductDaoImpl;
import cn.edu.xjtu.ects.impl.UserDaoImpl;



public class OrderHandler extends MappingDispatchAction{
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		IUserDao userDao = new UserDaoImpl();
		IOrderDao orderDao = new OrderDaoImpl();
		IProductDao proDao = new ProductDaoImpl();
		
		//修改用户信息
		User user = (User)req.getSession().getAttribute("user");
		user.setName(req.getParameter("name"));
			
		ContactInfo info = user.getContcatInfo();
		info.setAddress(req.getParameter("address"));
		
		info.setCellPhone(req.getParameter("cellPhone"));
		info.setEmail(req.getParameter("email"));
		
		
		
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
		order.setOrderStatus(getOrderStatus(1));
		order.setUser(user);
		Product product = new Product();
		
		//将orderLine绑定在order上，shopcart里面未实现
		for (Iterator iterator = order.getOrderLines().iterator(); iterator.hasNext();) {
			//((OrderLine) iterator.next()).setOrder(order);
			OrderLine line = (OrderLine) iterator.next();
			product = line.getProduct();
			product.setPrice(line.getProduct().getPrice()+line.getAmount());
			
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
		
		IOrderDao orderDao = new OrderDaoImpl();
		User user = (User)req.getSession().getAttribute("user");
		
		//获取orderList
		Collection orderList = orderDao.findAll(user.getName());
	
		
		
		req.setAttribute("orderList",orderList);
		return mapping.findForward("orderList");
	}
	
	
	public ActionForward detail(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp)
			throws Exception {		
		
		IOrderDao orderDao = new OrderDaoImpl();

		Order order = null;
		Integer orderId = Integer.parseInt(req.getParameter("orderId"));
		
		order = orderDao.findById(orderId);		
		req.setAttribute("order",order);
		
		return mapping.findForward("orderDetail");
	}
	/*private PayWay getPayWay(int Id){
		
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
	}*/
	
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
