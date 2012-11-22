package com.ambow.ects.dao.impl;

import java.util.Collection;
import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ambow.ecport.exception.ManagerProductException;
import com.ambow.ecport.exception.ManagerUserException;
import com.ambow.ects.dao.IProductDao;
import com.ambow.ects.entity.Product;
import com.ambow.ects.util.HibernateUtils;


public class ProductDaoImp implements IProductDao {

	public Product findById(Integer id) throws ManagerProductException {
		Session session = null;
		Transaction tran = null;
		Product product = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			product = (Product) session.get(Product.class, id);
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			throw new ManagerProductException(e.getMessage());
		} finally {
			session.close();
			
		}
		return product;
	}

	public Collection findAll() throws ManagerProductException {
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			list = session.createQuery(" from Product ").list();
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

	public Collection find(int start, int max) throws ManagerProductException {
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery(" from Product ");
			query.setFirstResult(start);
			query.setMaxResults(max);
			list = query.list();
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
			
		}
		return list;

	}
	
	public Collection findByTime(int start, int max) throws ManagerProductException {
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Date date = new Date();
			int i = date.getYear();
			String hql = "from Product product where Year(product.time) =:time";  
			
			Query query = session.createQuery(hql).setInteger("time", i+1900);
			query.setFirstResult(start);
			query.setMaxResults(max);
			list = query.list();
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
			
		}
		return list;

	}
	
	public Collection findByDiscount(int start, int max) throws ManagerProductException {
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery(" from Product product where product.discounted = 1 ");
			query.setFirstResult(start);
			query.setMaxResults(max);
			list = query.list();
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
			
		}
		return list;

	}
	
	public Collection findByPromoted(int start, int max) throws ManagerProductException {
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery(" from Product product where product.promoted = 1 ");
			query.setFirstResult(start);
			query.setMaxResults(max);
			list = query.list();
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
			
		}
		return list;
		
		

	}


	public int getTotal() throws ManagerProductException {
		Session session = null;
		Transaction tran = null;
		int total = 0;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			total = session.createQuery("From  Product").list().size();			
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
			
		}
		return total;

	}
//此方法用于动态条件查询
	public Collection find(String cateName,String model,String type,String cpu,String disk,
			double size1,double lo,double mo,int start,int max) throws ManagerProductException {
		
		String condition = "&cateName="+cateName+"&model="+model+"&type="+type+"&cpu="+cpu
		+"&disk="+disk+"&size="+size1+"&lo="+lo+"&mo="+mo;
		Collection collection = null;
		
		Session session = null;
		try{
		session = HibernateUtils.getSession();
		session.beginTransaction();
		
		String hql = "select product from Product product";
		
		if(!"".equals(cateName))
		{
			hql +=" left join fetch product.category where product.category.name=:cateName";
		}
		else{
			hql +=" where :cateName=:cateName ";
		}
		if(!"".equals(model))
		{
			hql +=" and product.model=:model";
		}
		else
		{
			hql +=" and :model=:model";
		}
		if(!"100".equals(type))
		{
			hql +=" and product.type=:type";
		}
		else
		{
			hql +=" and :type=:type";
		}
		if(!"".equals(cpu))
		{
			hql +=" and product.cpu=:cpu";
		}
		else
		{
			hql +=" and :cpu=:cpu";
		}
		if(!"1".equals(disk))
		{
			hql +=" and product.disk=:disk";
		}
		else
		{
			hql +=" and :disk=:disk";
		}
		if(size1!=20)
		{
			hql +=" and floor(product.size)=:size1";
		}
		else
		{
			hql +=" and :size1=:size1";
		}
		if(lo!=1 )
		{
			hql +=" and product.basePrice>=:lo";
		}
		else
		{
			hql +=" and :lo=:lo";
		}
		if(mo!=9999999)
		{
			hql +=" and product.basePrice<=:mo";
		}
		else
		{
			hql +=" and :mo=:mo";
		}
		
			/*String hql = "from Product product left join fetch product.category " +
					"where product.category.name=:cateName and " +
					"product.model=:model and product.type=:type and  " +
					"product.cpu=:cpu and product.disk=:disk and product.size=:size1";*/
			
		Query query =session.createQuery(hql).setString("cateName",cateName ).
		setString("model", model).setString("type", type).setString("cpu", cpu).
		setString("disk", disk).setDouble("size1", size1)
		.setDouble("lo", lo).setDouble("mo", mo);
		query.setFirstResult(start);
		query.setMaxResults(max);
		
		System.out.println("阿斯顿发撒旦发"+query.getQueryString());
		
		collection = query.list();
				  												
		}catch(Exception e){
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			session.close();
			return collection;
		}

	}
	
	
	//商品排行
	public Collection rankProduct()throws ManagerProductException{
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			list = session.createQuery("from Product order by saleVolume desc").setFirstResult(1).setMaxResults(10).list();
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			throw new ManagerProductException(e.getMessage());
		} finally {	
			System.out.println("================================"+session);
			session.close();
			return list;
		}
	}

	

	public Collection findByDiscount() throws ManagerProductException {
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			String hql = "from Product product where product.discounted = 1";
			list = session.createQuery(hql).setFirstResult(1).setMaxResults(3).list();
			tran.commit();
			
		}catch(Exception e){
			e.printStackTrace();
			tran.rollback();
		}finally{
			session.close();
		}
		
		return list;
	}



	public Collection hotCategory() throws ManagerProductException
	{
		Session session = HibernateUtils.getSession();
		
		session.getTransaction().begin();
		
		Collection list =null;
		try 
		{		
		  String hql = "select product from Product product left join fetch product.category group by product.category.id  order by sum(product.saleVolume) desc";		  
		  list = session.createQuery(hql).setFirstResult(1).setMaxResults(10).list();
		  System.out.println(list.size());
		  session.getTransaction().commit();
		   	
	        }catch(Exception e)
		{
			session.getTransaction().rollback();
		}finally
		{
			session.close();
			return list;
		}
		
	}
	
	


	public Collection findByPromoted() throws ManagerProductException {
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			String hql = "from Product product where product.promoted = 1";
			list = session.createQuery(hql).list();
			tran.commit();
			
		}catch(Exception e){
			e.printStackTrace();
			tran.rollback();
		}finally{
			session.close();
		}
		
		return list;
	}

	public Collection findByTime() throws ManagerProductException {
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Date date = new Date();
			int i = date.getYear();
			System.out.println(i);
			
			String hql = "from Product product where Year(product.time) =:time";  
			
			list = session.createQuery(hql).setInteger("time", i+1900).setFirstResult(1).setMaxResults(3).list();
			tran.commit();
			
		}catch(Exception e){
			e.printStackTrace();
			tran.rollback();
		}finally{
			session.close();
		}
		
		return list;
	}

	//按品牌分页查询
	public Collection findByCategory(int start, int max ,int id)
			throws ManagerProductException {

		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery("select p from Product p where p.category.id = :id");
			query.setInteger("id", id);
			query.setFirstResult(start);
			query.setMaxResults(max);
			list = query.list();
			
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
			
		}
		return list;
	}
	
	//按类型分页查询
	public Collection findByType(int start, int max ,String type)
			throws ManagerProductException {

		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery("select p from Product p where p.type = '"+type+"'");
			System.out.println(query.getQueryString());
			query.setFirstResult(start);
			query.setMaxResults(max);
			list = query.list();
			
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
			
		}
		return list;
	}
	
	//按价格分页查询
	public Collection findByPrice(int start, int max ,int low , int high)
			throws ManagerProductException {

		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery("select p from Product p where p.basePrice >= :low and p.basePrice <= :high");
			query.setInteger("low", low).setInteger("high", high);
			query.setFirstResult(start);
			query.setMaxResults(max);
			list = query.list();
			
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
			
		}
		return list;
	}
	
	//按品牌分页查询
	public Collection findBySize(int start, int max ,String size)
			throws ManagerProductException {
		
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery("select p from Product p where round(p.size)"+size);
			
			query.setFirstResult(start);
			query.setMaxResults(max);
			list = query.list();
			
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			
			session.close();			
		}
		return list;
	}

	public void update(Product product) throws ManagerUserException {
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(product);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
		}
		
	}

}
