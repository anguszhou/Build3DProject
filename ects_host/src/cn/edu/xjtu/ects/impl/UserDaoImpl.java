package cn.edu.xjtu.ects.impl;

import java.util.Collection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.xjtu.ects.util.HibernateUtils;

import cn.edu.xjtu.ects.dao.IUserDao;
import cn.edu.xjtu.ects.entity.ContactInfo;
import cn.edu.xjtu.ects.entity.User;
import cn.edu.xjtu.ects.exception.ManagerProductException;
import cn.edu.xjtu.ects.exception.ManagerUserException;

public class UserDaoImpl implements IUserDao {

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
		}
		return  list;
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
		}
		return  user;
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
		}
		return  user;
	}

	public List login(String name) throws ManagerUserException {
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
		}
		return  userList;
	}

	public void update(User user) throws ManagerUserException {
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(user);
			System.out.println(user.getName());
			System.out.println(user.getPasswd());
			System.out.println("genngxin");
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerUserException(e.getMessage());
		}finally{
			session.close();
		}

	}
	public static void main(String []args) throws ManagerUserException{
		IUserDao dao = new UserDaoImpl();
		
		User user = dao.findById(14);
		System.out.println(user.getName());
		System.out.println(user.getPasswd());
		System.out.println(user.getId());
		/*user.setName("wan");
		user.setPasswd("123");
		
		//ContactInfo info = new ContactInfo("12132","djksj","djoafj");
		ContactInfo info = new ContactInfo();
		info.setAddress("jfldsjfl");
		user.setContcatInfo(info);
		info.setUser(user);
		
		try {			
			dao.add(user);
			//System.out.println(user.getContcatInfo().getId());
			//System.out.println(info.getUser().getUser_id());
		} catch (ManagerUserException e) {
			e.printStackTrace();
		}*/
		
	}
	public int getTotal() throws ManagerUserException
	{
		Session session = null;
		Transaction tran = null;
		int total = 0;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			total = session.createQuery("From  User").list().size();			
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
			Query query = session.createQuery(" from User ");
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
