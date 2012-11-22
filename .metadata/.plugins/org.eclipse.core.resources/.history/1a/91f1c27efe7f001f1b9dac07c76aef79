package cn.edu.xjtu.ects.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.xjtu.ects.dao.ICommentDao;
import cn.edu.xjtu.ects.dao.IProductDao;
import cn.edu.xjtu.ects.entity.Comment;
import cn.edu.xjtu.ects.exception.ManagerUserException;
import cn.edu.xjtu.ects.impl.CommentDaoImpl;
import cn.edu.xjtu.ects.impl.ProductDaoImpl;
import cn.edu.xjtu.ects.util.HibernateUtils;

 

public class CommentHandler extends MappingDispatchAction{
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
		
		
		Session session = null;
		Transaction tran = null;
		
		ICommentDao dao = new CommentDaoImpl();
		IProductDao productDao = new ProductDaoImpl();
		
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
			request.setAttribute("productDetail", new ProductDaoImpl().findById(productId));
			
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
}
