package xjtu.citi.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {

	private  static   SessionFactory   factory;
	
	static{
		try
        {
            factory = new Configuration().configure("xjtu/citi/xml/hibernate.cfg.xml").buildSessionFactory();
        } catch (Throwable ex)
        {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }	}
	
	public  static  Session   getSession(){			
		return    factory.openSession();
	}
	
	public  static  void  main(String [] args){
		System.out.println( HibernateUtils.getSession());
	}
}
