 package cn.edu.xjtu.ects.dao;
import java.util.Collection;

import cn.edu.xjtu.ects.exception.ManagerOrderException;
import cn.edu.xjtu.ects.exception.ManagerOrderStatusException;
import cn.edu.xjtu.ects.entity.Order;
import cn.edu.xjtu.ects.entity.OrderStatus;

 


public interface IOrderStatusDao {
	//��Ӷ���
	public  void  addOrderStatus(OrderStatus orderStatus)throws ManagerOrderStatusException;
	//�ҳ���Ϊuser_name�����ж���
	public  Collection  findAll(String user_name)throws ManagerOrderStatusException;
	//�ҳ�id�Ķ���
	public  OrderStatus  findById(Integer id)throws  ManagerOrderStatusException;
	public void delete(OrderStatus orderStatus)throws  ManagerOrderStatusException;
	public void update(OrderStatus orderStatus)throws  ManagerOrderStatusException;
}