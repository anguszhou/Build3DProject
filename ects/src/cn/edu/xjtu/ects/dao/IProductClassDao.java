package cn.edu.xjtu.ects.dao;

import java.util.Collection;

import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.entity.ProductClass;
import cn.edu.xjtu.ects.exception.ManagerProductException;

public interface IProductClassDao {

	public ProductClass findByProductClass_id(Integer id) throws ManagerProductException;
	 
	public Collection findAll()throws ManagerProductException;
	
	public void addProductClass(ProductClass productclass)throws ManagerProductException;
		
	public void delete(ProductClass productclass) throws ManagerProductException;
	
	public void update(ProductClass productclass) throws ManagerProductException;
	
	public ProductClass findByName(String name) throws ManagerProductException;
}
