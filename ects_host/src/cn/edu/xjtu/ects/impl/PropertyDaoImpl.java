package cn.edu.xjtu.ects.impl;

import java.util.Collection;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.xjtu.ects.dao.IProductDao;
import cn.edu.xjtu.ects.dao.IPropertyDao;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.entity.ProductClass;
import cn.edu.xjtu.ects.entity.Property;
import cn.edu.xjtu.ects.exception.ManagerProductException;
import cn.edu.xjtu.ects.util.HibernateUtils;

public class PropertyDaoImpl implements IPropertyDao
{
	
	
	public static void main(String[] args) throws ManagerProductException
	{
		
		Property a = new Property();
		Product b = new Product();
	
		IPropertyDao aa =new  PropertyDaoImpl();
		IProductDao  bb = new ProductDaoImpl();
	     a = aa.findByName("345", 67);
	     System.out.println(a.getPropertyValue());
		
	}

	public Collection findByProduct() throws ManagerProductException
	{
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			list = session.createQuery(" from Property ").list();
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			throw new ManagerProductException(e.getMessage());
		} finally {			
			session.close();			
		}
		return list;
	}

	public Property findById(Integer id) throws ManagerProductException
	{
		Session session = null;
		Transaction tran = null;
		Property property = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			property = (Property) session.get(Property.class, id);
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			throw new ManagerProductException(e.getMessage());
		} finally {
			session.close();
			
		}
		return property;
	}

	public void addProperty(Property property) throws ManagerProductException
	{
		
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.save(property);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
	}

	public void delete(Property property) throws ManagerProductException
	{
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.delete(property);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
		
	}

	public void update(Property property) throws ManagerProductException
	{
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(property);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
		
	}
	public Property findByName(String name,int id) throws ManagerProductException
	{
		Session session = null;
		Transaction tran = null;
		Property property = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery("select pc from Property pc left join fetch pc.product where pc.propertyName = :name and pc.product.product_id = :id");
			query.setString("name", name).setInteger("id", id);
			property = (Property)query.uniqueResult();
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			throw new ManagerProductException(e.getMessage());
		} finally {
			session.close();			
		}
		return property;
	}
	
}
