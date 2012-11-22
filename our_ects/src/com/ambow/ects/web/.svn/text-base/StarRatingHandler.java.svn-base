package com.ambow.ects.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ambow.ecport.exception.ManagerUserException;
import com.ambow.ects.dao.IProductDao;
import com.ambow.ects.dao.impl.ProductDaoImp;
import com.ambow.ects.entity.Product;
import com.ambow.ects.entity.StarRating;
import com.ambow.ects.entity.User;
import com.ambow.ects.util.HibernateUtils;

public class StarRatingHandler extends MappingDispatchAction
{

	public ActionForward addStarRating(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		int star = Integer.parseInt(request.getParameter("star"));

		int productId = Integer.parseInt(request.getParameter("productId"));
		Session session = null;
		Transaction tran = null;
		
		IProductDao dao = new ProductDaoImp();
		Product product = dao.findById(productId);
		StarRating starRating = null;
		
		try
		{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			starRating = (StarRating) session.createQuery("from StarRating where id=:id").setInteger("id", productId).uniqueResult();
			
			if (starRating == null)
			{
				starRating = new StarRating(productId, 0, 0, 0, product);
				System.out.println("starRating is null");
				starRating.setPersonNum(1);
				starRating.setTotalStar(star);
				starRating.setAvgStar(star);
				
				session.save(starRating);
				tran.commit();
			}
			else
			{
				int personNum = starRating.getPersonNum();
				int totalStar = starRating.getTotalStar();
				double avgStar = starRating.getAvgStar();
				
				starRating.setPersonNum(personNum + 1);
				starRating.setTotalStar(totalStar + star);
				avgStar = (double) starRating.getTotalStar()/starRating.getPersonNum();
				starRating.setAvgStar(Double.parseDouble((new java.text.DecimalFormat("0.0").format(avgStar))));
				System.out.println(starRating.getId());
				System.out.println(starRating.getTotalStar());
				session.update(starRating);
				tran.commit();
			}
			
			/*product = (Product) request.getAttribute("productDetail");
			System.out.println(product.getId());
			product.setStarRating(starRating);
			starRating.setProduct(product);*/
			
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
		
		
		return mapping.findForward("star");
	}
}