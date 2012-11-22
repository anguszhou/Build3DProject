 package cn.edu.xjtu.ects.dao;
import java.util.Collection;

import cn.edu.xjtu.ects.exception.ManagerOrderException;
import cn.edu.xjtu.ects.entity.Order;

 


public interface IOrderDao {
	//��Ӷ���
	public  void  addOrder(Order order)throws ManagerOrderException;
	//�ҳ���Ϊuser_name�����ж���
	public  Collection  findAll(String user_name)throws ManagerOrderException;
	//�ҳ�id�Ķ���
	public  Order  findById(Integer id)throws  ManagerOrderException;
	public void delete(Order order)throws  ManagerOrderException;
	public void update(Order order)throws  ManagerOrderException;
}