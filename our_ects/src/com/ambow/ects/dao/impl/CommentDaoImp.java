package com.ambow.ects.dao.impl;

import java.util.Collection;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ambow.ecport.exception.ManagerProductException;
import com.ambow.ecport.exception.ManagerUserException;
import com.ambow.ects.dao.ICommentDao;
import com.ambow.ects.entity.Comment;
import com.ambow.ects.entity.User;
import com.ambow.ects.util.HibernateUtils;

public class CommentDaoImp implements ICommentDao
{

	public Collection findByProductId(Integer id)
			throws ManagerProductException
	{
		Session session = null;
		Transaction tran = null;
		Collection list = null;
		try
		{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			list = session.createQuery("from Comment c where c.product=:id order by c.commentDate desc").setInteger("id", id).list();
			System.out.println(list.size());
			tran.commit();
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			tran.rollback();
			throw new ManagerProductException(e.getMessage());
		}
		finally
		{
			session.close();
			return list;
		}
	}

	public void addComment(Comment comment) throws ManagerProductException
	{
		Session   session = null;
		Transaction  tran = null;
		try{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.save(comment);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw new ManagerProductException(e.getMessage());
		}finally{
			session.close();
		}
	}

}
