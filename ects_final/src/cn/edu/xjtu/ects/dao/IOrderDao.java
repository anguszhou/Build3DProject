 package cn.edu.xjtu.ects.dao;
import java.util.Collection;

import cn.edu.xjtu.ects.exception.ManagerOrderException;
import cn.edu.xjtu.ects.entity.Order;

 


public interface IOrderDao {
	//添加订单
	public  void  addOrder(Order order)throws ManagerOrderException;
	//找出名为user_name的所有订单
	public  Collection  findAll(String user_name)throws ManagerOrderException;
	//找出id的订单
	public  Order  findById(Integer id)throws  ManagerOrderException;
	public void delete(Order order)throws  ManagerOrderException;
	public void update(Order order)throws  ManagerOrderException;
}