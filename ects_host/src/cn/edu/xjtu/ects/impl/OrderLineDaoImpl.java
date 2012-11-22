package cn.edu.xjtu.ects.impl;

import java.util.Collection;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
  
import cn.edu.xjtu.ects.dao.IOrderLineDao;
 
import cn.edu.xjtu.ects.entity.OrderLine;
 
import cn.edu.xjtu.ects.exception.ManagerOrderLineException; 
import cn.edu.xjtu.ects.util.HibernateUtils;
 
 
public class OrderLineDaoImpl implements IOrderLineDao{
	public void addOrderLine(OrderLine orderLine) throws ManagerOrderLineException {
		Session  session  = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.save(orderLine);
			tran.commit();
		
		}catch(Exception e ){
			tran.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		
	}

	public Collection findAll(String user_name) throws ManagerOrderLineException {
		Session  session = null;
		Transaction   tran = null;
		Collection   list = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			list = session.createQuery(" from  OrderLine ol where ol.name =:name")
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

	public OrderLine findById(Integer id) throws ManagerOrderLineException {
		Session   session = null;
		Transaction  tran = null;
		OrderLine orderLine = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			orderLine = (OrderLine) session.get(OrderLine.class, id);			
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerOrderLineException(e.getMessage());
		}finally{
			session.close();			
		}
		return  orderLine;
	}

	public  static void main(String [] args)throws Exception{
		   
	}

	public void delete(OrderLine orderLine) throws ManagerOrderLineException {
		// TODO Auto-generated method stub
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.delete(orderLine);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerOrderLineException(e.getMessage());
		}finally{
			session.close();
		}
		
	}

	public void update(OrderLine orderLine) throws ManagerOrderLineException {
		// TODO Auto-generated method stub
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(orderLine);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerOrderLineException(e.getMessage());
		}finally{
			session.close();
		}
	}

	 


}
