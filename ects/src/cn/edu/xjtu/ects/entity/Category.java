package cn.edu.xjtu.ects.entity;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.xjtu.ects.exception.ManagerProductException;
import cn.edu.xjtu.ects.util.HibernateUtils;

public class Category {
	private Integer category_id;//类型ID
	private String name;//类型名
	private String descriptions;//类型描述
	
	private Set productClasses = new HashSet();//二级分类

	public Integer getCategory_id() {
		return category_id;
	}

	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public Set getProductClasses() {
		return productClasses;
	}

	public void setProductClasses(Set productClass) {
		this.productClasses = productClass;
	}
	
	/*get和set方法*/
	public Category findByName(String name) throws ManagerProductException
	{
		Session session = null;
		Transaction tran = null;
		Category category = null;
		try {
			session = HibernateUtils.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery("select c from Category c where c.name = :name");
			query.setString("name", name);
			category = (Category)query.uniqueResult();
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			throw new ManagerProductException(e.getMessage());
		} finally {
			session.close();
			
		}
		return category;
	}
	

}
