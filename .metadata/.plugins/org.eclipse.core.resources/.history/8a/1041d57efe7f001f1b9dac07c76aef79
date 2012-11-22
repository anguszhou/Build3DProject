package cn.edu.xjtu.ects.impl;

import java.util.Collection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.xjtu.ects.dao.ISellerDao;
import cn.edu.xjtu.ects.dao.IUserDao;
import cn.edu.xjtu.ects.entity.Seller;
import cn.edu.xjtu.ects.entity.User;
import cn.edu.xjtu.ects.exception.ManagerUserException;
import cn.edu.xjtu.ects.util.HibernateUtils;

public class SellerDaoImpl implements ISellerDao {

	public void add(Seller seller) throws ManagerUserException {
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.save(seller);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
		}

	}

	public void delete(Seller seller) throws ManagerUserException {
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.delete(seller);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
		}


	}

	public Collection findAll() throws ManagerUserException {
		Session   session = null;
		Transaction  tran = null;
		Collection list = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			list = session.createQuery(" from  Seller ").list();
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();			
		}
		return  list;
	}

	public Seller findById(Integer id) throws ManagerUserException {
		Session   session = null;
		Transaction  tran = null;
		Seller seller = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			seller = (Seller) session.get( Seller.class, id);			
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();			
		}
		return  seller;
	}

	public Seller login(String name, String passwd) throws ManagerUserException {
		Session session = null;
		Transaction  tran = null;
		Seller seller = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			seller=(Seller) session.createQuery(" from  Seller where name=:name and passwd =:passwd ").setString("name",name).setString("passwd",passwd).uniqueResult();
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw new ManagerUserException(e.getMessage() );
		}finally{
			session.close();			
		}
		return  seller;
	}

	public List login(String name) throws ManagerUserException {
		Session session = null;
		Transaction  tran = null;
		List sellerList = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery("select seller from Seller seller where seller.name='"+name+"'");
			
			sellerList = query.list();
			
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw new ManagerUserException(e.getMessage() );
		}finally{			
			session.close();			
		}
		return  sellerList;
	}

	public void update(Seller seller) throws ManagerUserException {
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(seller);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
		}

	}
	public static void main(String []args){
		/*IUserDao dao = new UserDaoImpl();
		User user = new User();
		user.setName("yang");
		user.setPasswd("1234");*/
		
		/*ISellerDao dao = new SellerDaoImpl();
		Seller seller = new Seller("cong","123");
		seller.setRealName("÷‹¥œ");
		seller.setCredit("first");
		seller.setShopName("hahahah");
		seller.setQQ("313516285");
		seller.setShopDescriptions("wonderful");*/
		
		ISellerDao dao = new SellerDaoImpl();
		Seller seller = new Seller();
		seller.setId(2);
		seller.setRealName("qwe");
		
		try {
			dao.update(seller);
		} catch (ManagerUserException e) {
			e.printStackTrace();
		}
		
	}
	
	public int getTotal() throws ManagerUserException
	{
		Session session = null;
		Transaction tran = null;
		int total = 0;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			total = session.createQuery("From  Seller").list().size();			
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
			
		}
		return total;
	}

	public Collection find(int start, int max) throws ManagerUserException {
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery(" from Seller ");
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
