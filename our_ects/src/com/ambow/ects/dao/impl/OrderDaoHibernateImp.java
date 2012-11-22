package com.ambow.ects.dao.impl;

import java.util.Collection;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ambow.ecport.exception.ManagerOrderException;
import com.ambow.ects.dao.IOrderDao;
import com.ambow.ects.entity.Order;
import com.ambow.ects.util.HibernateUtils;



public class OrderDaoHibernateImp implements  IOrderDao{

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

	public  static void main(String [] args)throws Exception{
		/*OrderDaoHibernateImp  imp = new OrderDaoHibernateImp();
		Order order = new Order();
		order.setCost(1000);
		
		Product p = new Product();
		p.setId(new Integer(1));
		
		PayWay py = new PayWay();
	    py.setId(new Integer(1));
	    
	    OrderStatus s = new OrderStatus();
	    s.setId(new Integer(1));
	    
	    User  u = new User();
	    u.setId(new Integer(1));
	    OrderLine line = new OrderLine();
	    line.setProduct(p);
	    line.setOrder(order);
	    
	    order.setPayWay(py);
	    order.setStatus(s);
	    order.setUser(u);
	    order.getOrderlines().add(line);
	    
	    imp.addOrder(order);*/
		System.out.println(new OrderDaoHibernateImp().findAll("Õı≈Ù").size());
		
	}

	public Collection findAll(String   user_name) throws ManagerOrderException {
		Session  session = null;
		Transaction   tran = null;
		Collection   list = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			list = session.createQuery(" from  Order o left join fetch o.status left join fetch o.payWay  where o.name =:name").setString("name", user_name).list();
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
			Hibernate.initialize(order.getOrderlines());
			tran.commit();
		}catch(Exception  e){
			e.printStackTrace();
			tran.rollback();
		}finally{
		session.close();
		return  order;	
		}
	}

	
}
