package com.ambow.ects.dao.impl;

import java.util.Collection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ambow.ecport.exception.ManagerUserException;
import com.ambow.ects.dao.IUserDao;
import com.ambow.ects.entity.User;
import com.ambow.ects.util.HibernateUtils;




public class UserDaoHibernateImp  implements  IUserDao{

	public void add(User user) throws ManagerUserException {
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.save(user);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
		}
	}

	public void delete(User user) throws ManagerUserException {
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.delete(user);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
		}
	}

	public void update(User user) throws ManagerUserException {
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(user);
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
			list = session.createQuery(" from  User ").list();
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
			return  list;
		}
	}

	public User findById(Integer id) throws ManagerUserException {
		Session   session = null;
		Transaction  tran = null;
		User  user = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			user = (User) session.get( User.class, id);			
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
			return  user;
		}
	}
	
	
	/*
	 * ≤‚ ‘¥˙¬Î
	 */
	public  static  void  main(String []  args)throws Exception{
		UserDaoHibernateImp  imp = new UserDaoHibernateImp();
		User user = new User();
		user.setId(new Integer(3));
		imp.delete(user);
		
	}

	public User login(String name, String passwd) throws ManagerUserException {
		Session session = null;
		Transaction  tran = null;
		User user = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			user=(User) session.createQuery(" from  User where name=:name and passwd =:passwd ").setString("name",name).setString("passwd",passwd).uniqueResult();
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw new ManagerUserException(e.getMessage() );
		}finally{
			session.close();
			return  user;
		}
		
		
	}

	public List login(String name) {
		
		Session session = null;
		Transaction  tran = null;
		List userList = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery("select user from User user where user.name='"+name+"'");
			
			userList = query.list();
			
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw new ManagerUserException(e.getMessage() );
		}finally{
			
			session.close();
			
			return  userList;
		}
	}

}
