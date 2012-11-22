package cn.edu.xjtu.ects.impl;

import java.util.Collection;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
 

import cn.edu.xjtu.ects.dao.IOrderDao;
import cn.edu.xjtu.ects.dao.IOrderLineDao;
import cn.edu.xjtu.ects.dao.IOrderStatusDao;
import cn.edu.xjtu.ects.dao.IProductDao;
import cn.edu.xjtu.ects.dao.IUserDao;
import cn.edu.xjtu.ects.entity.Order;
import cn.edu.xjtu.ects.entity.OrderLine;
import cn.edu.xjtu.ects.entity.OrderStatus;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.entity.User;
import cn.edu.xjtu.ects.exception.ManagerOrderException;
import cn.edu.xjtu.ects.exception.ManagerUserException;
 
import cn.edu.xjtu.ects.util.HibernateUtils;
 
 
public class OrderDaoImpl implements IOrderDao{
	public void addOrder(Order order) throws ManagerOrderException {
		Session  session  = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.save(order);
			tran.commit();
		
		}catch(Exception e ){
			tran.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		
	}

	public Collection findAll(String   user_name) throws ManagerOrderException {
		Session  session = null;
		Transaction   tran = null;
		Collection   list = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			list = session.createQuery(" from  Order o where o.name =:name")
			.setString("name", user_name).list();
			tran.commit();
		}catch(Exception  e){
			e.printStackTrace();
			tran.rollback();
		}finally{
		session.close();
		return  list;	
		}
		
	}

	public Order findById(Integer id) throws ManagerOrderException {
		Session  session = null;
		Transaction   tran = null;
		Order  order    = null;
		try{
		 
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			order = (Order)session.get(Order.class, id);
			Hibernate.initialize(order.getOrderLines());
			tran.commit();
		}catch(Exception  e){
			e.printStackTrace();
			tran.rollback();
		}finally{
		session.close();
		return  order;	
		}
	}

//	public  static void main(String [] args)throws Exception{
//     /*	IOrderDao orderDao = new OrderDaoImpl();
//		
//		User user = new User();
//		user.setUser_id(1);
//		
//		OrderStatus os = new OrderStatus();
//		os.setName("Ò¶ÀÚ³Ô·¹µÄ¶©µ¥");
//		IOrderStatusDao osDao = new OrderStatusDaoImpl();
//		osDao.addOrderStatus(os);
//		
//		Product product1 = new Product();
//		product1.setName("±«Óã");
//		 IProductDao po = new ProductDaoImpl();
//		 po.addProduct(product1);
//		 
//		IOrderLineDao olDao = new OrderLineDaoImpl();
//		OrderLine ol = new OrderLine();
//		ol.setProduct(product1);
//		
//		
//		 Order order = new Order();
//		 order.setCost(100);
//		 order.setOrderStatus(os);
//		 order.getOrderLines().add(ol);
//	
//		 ol.setOrder(order);
//		 olDao.addOrderLine(ol); 
//		 orderDao.addOrder(order);
//	 */
//		IOrderDao orderDao = new OrderDaoImpl();
//		
//		User user = new User();
//		user.setUser_id(1);
//		
//		OrderStatus os = new OrderStatus();
//		os.setOrderStatus_id(1);
//		IOrderStatusDao osDao = new OrderStatusDaoImpl();
//		osDao.delete(os);
//		
//		Product product1 = new Product();
//		product1.setProduct_id(1);
//		  
//		IOrderLineDao olDao = new OrderLineDaoImpl();
//		OrderLine ol = new OrderLine();
//		ol.setId(1);
//		
//		 Order order = new Order();
//		 order.setOrder_id(1); 
//		 
//		 
//		 olDao.delete(ol);
//		 orderDao.delete(order);
//		 
//	 
//	 
//		
//		   
//	}

	public void delete(Order order) throws ManagerOrderException {
		// TODO Auto-generated method stub
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.delete(order);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerOrderException(e.getMessage());
		}finally{
			session.close();
		}
		
	}

	public void update(Order order) throws ManagerOrderException {
		// TODO Auto-generated method stub
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(order);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerOrderException(e.getMessage());
		}finally{
			session.close();
		}
	}


}
