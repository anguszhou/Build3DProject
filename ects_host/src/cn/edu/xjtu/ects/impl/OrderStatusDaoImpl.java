package cn.edu.xjtu.ects.impl;

import java.util.Collection;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
 

import cn.edu.xjtu.ects.dao.IOrderDao;
import cn.edu.xjtu.ects.dao.IOrderStatusDao;
import cn.edu.xjtu.ects.dao.IProductDao;
import cn.edu.xjtu.ects.dao.IUserDao;
import cn.edu.xjtu.ects.entity.Order;
import cn.edu.xjtu.ects.entity.OrderLine;
import cn.edu.xjtu.ects.entity.OrderStatus;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.entity.User;
import cn.edu.xjtu.ects.exception.ManagerOrderException;
import cn.edu.xjtu.ects.exception.ManagerOrderLineException;
import cn.edu.xjtu.ects.exception.ManagerOrderStatusException;
import cn.edu.xjtu.ects.exception.ManagerUserException;
 
import cn.edu.xjtu.ects.util.HibernateUtils;
 
 
public class OrderStatusDaoImpl implements IOrderStatusDao{
	public void addOrderStatus(OrderStatus orderStatus) throws ManagerOrderStatusException {
		Session  session  = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.save(orderStatus);
			tran.commit();
		
		}catch(Exception e ){
			tran.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		
	}

	public Collection findAll(String   user_name) throws ManagerOrderStatusException {
		Session  session = null;
		Transaction   tran = null;
		Collection   list = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			list = session.createQuery(" from  OrderStatus os where os.name =:name")
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

	public OrderStatus findById(Integer id) throws ManagerOrderStatusException {
		Session   session = null;
		Transaction  tran = null;
		OrderStatus orderStatus = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			System.out.println("test1");
			orderStatus = (OrderStatus) session.get(OrderStatus.class, id);			
			System.out.println("test2");
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerOrderStatusException(e.getMessage());
		}finally{
			session.close();			
		}
		return  orderStatus;
	}
 

	public void delete(OrderStatus orderStatus) throws ManagerOrderStatusException {
		// TODO Auto-generated method stub
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.delete(orderStatus);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerOrderStatusException(e.getMessage());
		}finally{
			session.close();
		}
		
	}

	public void update(OrderStatus orderStatus) throws ManagerOrderStatusException {
		// TODO Auto-generated method stub
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(orderStatus);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerOrderStatusException(e.getMessage());
		}finally{
			session.close();
		}
	}
public static void main(String[] args) {
	IOrderStatusDao dao = new OrderStatusDaoImpl();
	OrderStatus os = new OrderStatus();
	os.setName("eric");
	os.setDescriptions("djflksjdf");
	try {
		dao.addOrderStatus(os);
	} catch (ManagerOrderStatusException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}
   
}
