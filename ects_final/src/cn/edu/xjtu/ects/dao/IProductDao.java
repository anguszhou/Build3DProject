package cn.edu.xjtu.ects.dao;

import java.util.Collection;

import cn.edu.xjtu.ects.entity.Product;
import cn.edu.xjtu.ects.exception.ManagerProductException;

public interface IProductDao {

	public  Product  findById(Integer  id )throws ManagerProductException;
	public  Collection   findAll( )throws ManagerProductException;
	public  void addProduct(Product product)throws ManagerProductException;
	public void delete(Product product) throws ManagerProductException;
	public void update(Product product) throws ManagerProductException;
	public  int   getTotal()throws  ManagerProductException;
	
	//����Ʒ�Ʒ�ҳ��ѯ
	public  Collection  findByProductClass(int start, int max ,int id)throws ManagerProductException;
	
	//����Ϊ��ҳ�����Ľӿ�
	public  Collection   find(int start, int max)throws  ManagerProductException;
	
	//���������̼ҷ�ҳ��ѯ
	public  Collection  findBySellerId(int start, int max ,int id)throws ManagerProductException;
}
