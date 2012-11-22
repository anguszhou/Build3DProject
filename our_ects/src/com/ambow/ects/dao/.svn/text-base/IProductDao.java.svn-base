package com.ambow.ects.dao;

import java.util.Collection;
import com.ambow.ecport.exception.ManagerProductException;
import com.ambow.ecport.exception.ManagerUserException;
import com.ambow.ects.entity.Product;
import com.ambow.ects.entity.User;



public interface IProductDao {
	
	public void update(Product product) throws ManagerUserException; 
	
	public  Product  findById(Integer  id )throws ManagerProductException;
	public  Collection   findAll( )throws ManagerProductException;
	
	//以下为分页方法的接口
	public  Collection   find(int start, int max)throws  ManagerProductException;
	public  Collection   findByPromoted(int start, int max)throws  ManagerProductException;
	public  Collection   findByDiscount(int start, int max)throws  ManagerProductException;
	public  Collection   findByTime(int start, int max)throws  ManagerProductException;
	public  int   getTotal()throws  ManagerProductException;
   
	//此方法用于根据条件动态查询商品信息
	public Collection find(String cateName,String model,String type,String cpu,String disk,
			double size1,double lo,double mo,int start,int max) throws ManagerProductException;

	
	//此方法返回前10名热门品牌的集合
	public  Collection  hotCategory()throws ManagerProductException; 

	
	//推荐产品
	public Collection findByPromoted() throws ManagerProductException;
	
	
	
	//打折产品
	public Collection findByDiscount() throws ManagerProductException;
	
	//新品上市
	public Collection findByTime() throws ManagerProductException;
	


	//商品排行
	public Collection rankProduct()throws ManagerProductException;
	
	
	//按照品牌分页查询
	public  Collection  findByCategory(int start, int max ,int id)throws ManagerProductException;


	//按照价格分页查询
	public  Collection  findByPrice(int start, int max ,int low , int  high)throws ManagerProductException;
	

	//按照尺寸分页查询
	public  Collection  findBySize(int start, int max ,String size)throws ManagerProductException;
	

	//按照类型分页查询
	public  Collection  findByType(int start, int max ,String type)throws ManagerProductException;

}
