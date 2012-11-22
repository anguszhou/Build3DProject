package xjtu.citi.impl;

import java.util.Collection;
import java.util.Date;
import org.hibernate.Session;
import org.hibernate.Transaction;
import xjtu.citi.dao.IFeedbackDao;
import xjtu.citi.entity.CompanyInfo;
import xjtu.citi.entity.Feedback;
import xjtu.citi.util.HibernateUtils;

public class FeedbackDaoImpl implements IFeedbackDao {

	public void add(Feedback feedback) {
		
		Session session =null;
		Transaction tran=null;
		try
		{
			session = HibernateUtils.getSession();
			tran=session.beginTransaction();
			session.save(feedback);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
		}finally
		{
			session.close();
			
		}
	}

	public void delete(Feedback feedback) {
		
		Session session =null;
		Transaction tran=null;
		try
		{
			session=HibernateUtils.getSession();
			tran=session.beginTransaction();
			session.delete(feedback);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
		}finally
		{
			session.close();
		}
	}

	public Collection findById(Integer id) {
		
		Session session =null;
		Transaction tran=null;
		Collection list = null;
		session = HibernateUtils.getSession();
		tran = session.beginTransaction();
		list=session.createQuery("from Feedback f where f.companyInfo.id = :id order by f.time asc").setInteger("id", id).list();
		System.out.println(list.size());
		tran.commit();
		session.close();
		System.out.println("success add");
		return list;
	}
	public  static void main(String [] args)throws Exception
	{
		Date time=new Date();
		time.setYear(2010);
		time.setMonth(7);
		time.setDate(30);
		CompanyInfo companyInfo = new CompanyInfo(1);
		Feedback feedback=new Feedback();
		feedback.setDescription("description");
		feedback.setReviewer(0);
		feedback.setTime(time);
		feedback.setCompanyInfo(companyInfo);
		FeedbackDaoImpl f =new FeedbackDaoImpl();
		//f.add(feedback);
		Collection feeds=null;
		feeds=f.findById(1);
	}
}
