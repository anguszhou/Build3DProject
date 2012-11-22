package cn.edu.xjtu.ects.impl;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.xjtu.ects.dao.ICommentDao;
import cn.edu.xjtu.ects.entity.Comment;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.exception.ManagerProductException;
import cn.edu.xjtu.ects.util.HibernateUtils;

public class CommentDaoImpl implements ICommentDao {

	public void addComment(Comment comment) throws ManagerProductException {

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

	public Collection findByProduct_id(Integer id)
			throws ManagerProductException {
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
		}
			return list;
		
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// test for addComment
		/*
		Product product = new Product();
		product.setProduct_id(4);
		
		Comment comment = new Comment();
		comment.setEmail("mail.qq.com");
		comment.setName("eric");
		comment.setProduct(product);
		Set comments = new HashSet();
		comments.add(comment);
		product.setComments(comments);
		ICommentDao dao = new CommentDaoImpl();
		try {
			dao.addComment(comment);
		} catch (ManagerProductException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		*/
		
		//test for findByProduct_id
		ICommentDao dao = new CommentDaoImpl();
		Collection<Comment> comments =null;
		try {
			comments = dao.findByProduct_id(4);
		} catch (ManagerProductException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(Comment object : comments)
		{
			System.out.println(object.getName());
			
		}
		
		

	}

}
