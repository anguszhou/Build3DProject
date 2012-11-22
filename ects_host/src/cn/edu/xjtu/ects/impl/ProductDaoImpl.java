package cn.edu.xjtu.ects.impl;

import java.util.Collection;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.xjtu.ects.dao.IProductDao;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.entity.Seller;
import cn.edu.xjtu.ects.exception.ManagerProductException;
import cn.edu.xjtu.ects.util.HibernateUtils;

public class ProductDaoImpl implements IProductDao
{
	
	
	public static void main(String[] args) throws ManagerProductException
	{
		//Collection<Product> temp=null;
		/*Product a = new Product();	
		Seller seller = new Seller();
		seller.setId(15);
		//a.setProduct_id(2);
		a.setName("周聪的商品");
		a.setSeller(seller);
		IProductDao aa = new ProductDaoImpl();
		
		aa.addProduct(a);*/
		//aa.delete(a);
		/*temp=aa.findAll();
		for (Product object : temp)
		{
			System.out.println(object.getName());
		}*/
		IProductDao dao = new ProductDaoImpl();
		Collection<Product>tn = dao.findBySellerId(0,100,17);
		for (Product object : tn)
		{
			System.out.println(object.getSeller().getRealName());
		}
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

	public Collection findAll() throws ManagerProductException
	{
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

	public Product findById(Integer id) throws ManagerProductException
	{
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

	public void addProduct(Product product) throws ManagerProductException
	{
		
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.save(product);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
	}

	public void delete(Product product) throws ManagerProductException
	{
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.delete(product);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
		
	}

	public void update(Product product) throws ManagerProductException
	{
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
			throw  new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
		
	}

	public int getTotal() throws ManagerProductException
	{
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

	//按品牌分页查询
	public Collection findByProductClass(int start, int max, int id)
			throws ManagerProductException
	{
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery("from Product p left join fetch p.productClass where p.productClass.productClass_id = :id");
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

	public Collection findBySellerId(int start, int max, int id)
			throws ManagerProductException
	{
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery("select product from Product product left join fetch product.seller  where product.seller.id =:id");
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
	
}
