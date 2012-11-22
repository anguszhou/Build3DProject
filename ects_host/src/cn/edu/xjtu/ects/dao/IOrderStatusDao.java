 package cn.edu.xjtu.ects.dao;
import java.util.Collection;

import cn.edu.xjtu.ects.exception.ManagerOrderException;
import cn.edu.xjtu.ects.exception.ManagerOrderStatusException;
import cn.edu.xjtu.ects.entity.Order;
import cn.edu.xjtu.ects.entity.OrderStatus;

 


public interface IOrderStatusDao {
	//添加订单
	public  void  addOrderStatus(OrderStatus orderStatus)throws ManagerOrderStatusException;
	//找出名为user_name的所有订单
	public  Collection  findAll(String user_name)throws ManagerOrderStatusException;
	//找出id的订单
	public  OrderStatus  findById(Integer id)throws  ManagerOrderStatusException;
	public void delete(OrderStatus orderStatus)throws  ManagerOrderStatusException;
	public void update(OrderStatus orderStatus)throws  ManagerOrderStatusException;
}