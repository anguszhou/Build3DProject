package cn.edu.xjtu.ects.impl;

import java.util.Collection;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.xjtu.ects.dao.IProductClassDao;
import cn.edu.xjtu.ects.entity.Category;
import cn.edu.xjtu.ects.entity.ProductClass;
import cn.edu.xjtu.ects.exception.ManagerProductException;
import cn.edu.xjtu.ects.util.HibernateUtils;

public class ProductClassDaoImpl implements IProductClassDao
{
	
	public static void main(String[] args) throws ManagerProductException
	{
		Collection<ProductClass> ten= null ; 
		ProductClass a = new ProductClass();	
		a.setProductClass_id(6);
		//a.setName("546757");		
		IProductClassDao aa = new ProductClassDaoImpl();
		System.out.println(aa.findByProductClass_id(7).getName());
		//aa.addProductClass(a);
		/*ten = aa.findAll();
		for(ProductClass i : ten)
		{
			System.out.println(i.getName());
		}*/
	}

	public Collection findAll() throws ManagerProductException
	{		
		Session session = null ; 
		Transaction tran = null ; 
		Collection list = null ; 
		try
		{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			list = session.createQuery("from ProductClass").list();
			tran.commit();
		}catch(Exception e)
		{
			e.printStackTrace();
			tran.rollback();
		}finally
		{
			session.close();
		}
		System.out.println(list.size());
		return list;
	}

	public ProductClass findByProductClass_id(Integer id)
			throws ManagerProductException
	{
		Session session = null ;
		Transaction tran = null ;
		ProductClass pclass = null;
		try
		{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			pclass = (ProductClass)session.get(ProductClass.class, id);
			tran.commit();
			
		}catch(Exception e)
		{
			e.printStackTrace();
			tran.rollback();
			throw new ManagerProductException(e.getMessage());
		} finally 
		{
			session.close();			
		}
		
		return pclass;
	}

	public void addProductClass(ProductClass productclass)
			throws ManagerProductException
	{
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.save(productclass);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
		
	}

	public void delete(ProductClass productclass)
			throws ManagerProductException
	{
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.delete(productclass);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
		
	}

	public void update(ProductClass productclass)
			throws ManagerProductException
	{
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(productclass);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
		
	}

	public ProductClass findByName(String name) throws ManagerProductException
	{
		Session session = null;
		Transaction tran = null;
		ProductClass productClass = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery("select pc from ProductClass pc left join fetch pc.category where pc.name = :name");
			query.setString("name", name);
			productClass = (ProductClass)query.uniqueResult();
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			throw new ManagerProductException(e.getMessage());
		} finally {
			session.close();			
		}
		return productClass;
	}
	
}
