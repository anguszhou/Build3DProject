package xjtu.citi.impl;

import xjtu.citi.dao.IWarnParameterDao;
import xjtu.citi.entity.WarnParameter;
import xjtu.citi.util.HibernateUtils;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class WarnParameterDaoImpl implements IWarnParameterDao {

	public void add(WarnParameter warnpara) {
		
		Session session=null;
		Transaction tran=null;
		try
		{
			session = HibernateUtils.getSession();
			session.beginTransaction();
			session.save(warnpara);
			tran.commit();
		}
		finally
		{
			session.close();
		}
	}

	public WarnParameter find() {
		
		Session session=null;
		Transaction tran=null;
		WarnParameter parameter=null;
		session=HibernateUtils.getSession();
		tran=session.beginTransaction();
		//parameter=(Parameter)session.get(Parameter.class,id);
		parameter=(WarnParameter)session.createQuery("from WarnParameter p1 where p1.id=(select max(p2.id) from WarnParameter p2)").uniqueResult();
		tran.commit();
		session.close();
		return parameter;
	
	}


	public void modify(WarnParameter warnpara) {
		
		Session   session = null;
		Transaction  tran = null;
		try
		{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(warnpara);
			tran.commit();
		}
		finally
		{
			session.close();
		}
	}

}
