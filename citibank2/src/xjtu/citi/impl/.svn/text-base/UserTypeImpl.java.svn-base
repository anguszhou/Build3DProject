package xjtu.citi.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import xjtu.citi.util.HibernateUtils;

import xjtu.citi.dao.IUserTypeDao;
import xjtu.citi.entity.UserType;
public class UserTypeImpl implements IUserTypeDao{
	public void add(UserType usertype)
	{
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.save(usertype);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	//删除用户
	public void delete(UserType usertype)
	{
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.delete(usertype);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	//更新用户信息
	public void update(UserType usertype)
	{
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(usertype);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	//按类型名称查询
	public UserType findByType(String usertypename) 
	{
		Session session=null;
		Transaction tran=null;
		UserType usertype=null;
		
			session=HibernateUtils.getSession();
			tran=session.beginTransaction();
		
			usertype=(UserType)session.createQuery("from UserType ut where ut.name=:usertypename").setParameter("usertypename", usertypename).uniqueResult();
			tran.commit();
			session.close();
			return usertype;
	}
public static void main(String args[])
	{
		UserType usertype=null;
		UserTypeImpl usertypeimpl=new UserTypeImpl();
		usertype=usertypeimpl.findByType("worker");
		System.out.println("查询完成："+usertype.getId());
	}
}
		

