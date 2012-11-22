package xjtu.citi.impl;

import java.util.Collection;
import java.util.Iterator;

import org.hibernate.Session;
import org.hibernate.Transaction;

import xjtu.citi.dao.IWarnInfoDao;
import xjtu.citi.entity.WarnInfo;
import xjtu.citi.util.HibernateUtils;

public class WarnInfoDaoImpl implements IWarnInfoDao {

	public double calWarnValue() {
		
		double result = 0;
		WarnInfo warninfo = new WarnInfo();
		result = (warninfo.getLatevalue() - warninfo.getPrevalue())/warninfo.getPrevalue();
		return result;
		
	}

	public Boolean isOverLimited() {
		
		IWarnInfoDao dao = new WarnInfoDaoImpl();
		WarnInfo warninfo = new WarnInfo();
		double limited = warninfo.getWarnpara().getValue();
		if(dao.calWarnValue() >= limited){
			return true;
		}
		return false;
		
	}

	public Collection<WarnInfo> getWarnInfo() {
		
		Session   session = null;
		Transaction  tran = null;
		
		session = HibernateUtils.getSession();
		tran = session.beginTransaction();
		
	
	
	    /*	Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/citi", "root", "1234");	
			st = conn.createStatement();
			String sql = "select * from SMEassessment p3 where p3.time=(select 1 p1.time from (select top 2 p2.time from SMEassessment p2 order by p2.time desc) order by p1.time asc)";
			rs = st.executeQuery(sql);*/
			
			Collection<WarnInfo>pre = session.createQuery("from WarnInfo p1 where p1.time=(select max(p2.time) from WarnInfo p2)").list();
			//Collection<SMEassessment>d = (Collection<SMEassessment>) session.createQuery("from SMEassessment p2  group by p2.time order by p2.time desc").setMaxResults(2).list();
			//Date d = (Date) session.createQuery("select max(time) from (select p2.time from SMEassessment p2 order by p2.time desc) ").uniqueResult();
			//Collection<SMEassessment>late = (Collection<SMEassessment>) session.createQuery("from SMEassessment p3 where p3.time=(select min(p1.time) from d)").list();
			for (Iterator iterator = pre.iterator(); iterator.hasNext();)
			{
				WarnInfo e = (WarnInfo) iterator.next();
				System.out.println(e.getId());
			}
			return pre;
	    
	}
	public static void main(String[] args)
	{
	  IWarnInfoDao dao = new WarnInfoDaoImpl();
	   dao.getWarnInfo();
	}
}
