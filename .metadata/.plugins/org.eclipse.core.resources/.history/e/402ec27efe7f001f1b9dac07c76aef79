package cn.edu.xjtu.ects.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.xjtu.ects.dao.IProductDao;
import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.entity.StarRating;
import cn.edu.xjtu.ects.exception.ManagerUserException;
import cn.edu.xjtu.ects.impl.ProductDaoImpl;
import cn.edu.xjtu.ects.util.HibernateUtils;

 
public class StarRatingHandler extends MappingDispatchAction{
	public ActionForward addStarRating(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		int star = Integer.parseInt(request.getParameter("star"));

		int productId = Integer.parseInt(request.getParameter("productId"));
		Session session = null;
		Transaction tran = null;
		
		IProductDao dao = new ProductDaoImpl();
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
		
		
		return mapping.findForward("star");
	}
}
