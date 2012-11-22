package com.ambow.ects.web;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ambow.ecport.exception.ManagerUserException;
import com.ambow.ects.dao.ICommentDao;
import com.ambow.ects.dao.IProductDao;
import com.ambow.ects.dao.impl.CommentDaoImp;
import com.ambow.ects.dao.impl.ProductDaoImp;
import com.ambow.ects.entity.Comment;
import com.ambow.ects.util.HibernateUtils;

public class CommentHandler extends MappingDispatchAction
{

	public ActionForward addComment(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		String content = request.getParameter("content");
		int productId = Integer.parseInt(request.getParameter("productId"));
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date commentDate = new java.sql.Date(utilDate.getTime());
		System.out.println(commentDate);
		
		Session session = null;
		Transaction tran = null;
		
		ICommentDao dao = new CommentDaoImp();
		IProductDao productDao = new ProductDaoImp();
		
		Comment comment = new Comment();
		comment.setCommentDate(commentDate);
		comment.setContent(content);
		comment.setEmail(email);
		comment.setName(name);
		comment.setProduct(productDao.findById(productId));
		
		
		try
		{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.save(comment);
			tran.commit();			
			request.setAttribute("productDetail", new ProductDaoImp().findById(productId));
			
		} 
		catch (Exception e)
		{
			tran.rollback();
			e.printStackTrace();
			throw new ManagerUserException(e.getMessage());
		} 
		finally
		{
			session.close();
		}

		return mapping.findForward("comment");
	}
	
	/*public ActionForward listComment(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		int productId = Integer.parseInt(request.getParameter("productId"));
		ICommentDao dao = new CommentDaoImp();
		List commentList;
		
		try
		{
			commentList = (List) dao.findByProductId(productId);
			request.setAttribute("commentList", commentList);
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return mapping.findForward("commentList");
	}*/
}