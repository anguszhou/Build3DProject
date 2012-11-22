package cn.edu.xjtu.ects.impl;

import java.util.Collection;
import org.hibernate.Session;
import org.hibernate.Transaction;
import cn.edu.xjtu.ects.dao.INoticeDao;
import cn.edu.xjtu.ects.entity.notice;
import cn.edu.xjtu.ects.exception.ManagerProductException;
import cn.edu.xjtu.ects.util.HibernateUtils;

public class NoticeDaoImpl implements INoticeDao
{
	
	
	public static void main(String[] args) throws ManagerProductException
	{
		Collection<notice> tn = null;
		notice a = new notice();
		//a.setid(2);
		//a.setNoticeContext("sdfasdfasdfsdf;fjksd");
		INoticeDao aa = new NoticeDaoImpl();
		//System.out.println(aa.findById(4).getNoticeContext());
		tn = aa.findAll();
		for(notice i : tn)
		{
			System.out.println(i.getNoticeContext());
		}
	}

	public Collection findAll() throws ManagerProductException
	{
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			list = session.createQuery(" from notice ").list();
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

	public notice findById(Integer id) throws ManagerProductException
	{
		Session session = null;
		Transaction tran = null;
		notice notice = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			notice = (notice) session.get(notice.class, id);
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			throw new ManagerProductException(e.getMessage());
		} finally {
			session.close();
			
		}
		return notice;
	}

	public void addNotice(notice notice) throws ManagerProductException
	{
		
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.save(notice);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
	}

	public void delete(notice notice) throws ManagerProductException
	{
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.delete(notice);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
		
	}

	public void update(notice notice) throws ManagerProductException
	{
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(notice);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw  new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
		
	}


}	
	

