package xjtu.citi.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import xjtu.citi.dao.IParameterDao;
import xjtu.citi.entity.Parameter;
import xjtu.citi.util.HibernateUtils;

public class ParameterDaoImpl implements IParameterDao {

	public void add(Parameter parameter) {
		
		Session session=null;
		Transaction tran=null;
		try{
			session = HibernateUtils.getSession();
			session.beginTransaction();
			session.save(parameter);
			tran.commit();
		}catch(Exception e){
			//tran.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		
	}

	public Parameter find() {
		
		Session session=null;
		Transaction tran=null;
		Parameter parameter=null;
		session=HibernateUtils.getSession();
		tran=session.beginTransaction();
		
		parameter=(Parameter)session.createQuery("from Parameter p1 where p1.id=(select max(p2.id) from Parameter p2)").uniqueResult();
		tran.commit();
		session.close();
		return parameter;
	
	}

	public void modify(Parameter parameter) {
		
		Session   session = null;
		Transaction  tran = null;
		try
		{
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			session.update(parameter);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
		}finally
		{
			session.close();
		}
	}
	
	public static void main(String [] args) throws Exception
	{
		
		ParameterDaoImpl p =new ParameterDaoImpl();
		Parameter parameter =new Parameter();
/*		parameter.setAin(1);
		parameter.setAout(1);
		parameter.setBin(2);
		parameter.setBout(2);
		parameter.setCashflow(1000);
		parameter.setCorecomp(200);
		parameter.setListedcomp(2);
		parameter.setRegistfund(3);*/
//		p.add(parameter);
		parameter=p.find();
		System.out.println(parameter.getId());
	}
}
