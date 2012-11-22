 package cn.edu.xjtu.ects.dao;
import java.util.Collection;

import cn.edu.xjtu.ects.exception.ManagerOrderException;
import cn.edu.xjtu.ects.exception.ManagerOrderLineException;
 
import cn.edu.xjtu.ects.entity.OrderLine;

 


public interface IOrderLineDao {
	//添加订单
	public  void  addOrderLine(OrderLine orderLine)throws ManagerOrderLineException;
	//找出名为user_name的所有订单
	public  Collection  findAll(String user_name)throws ManagerOrderLineException;
	//找出id的订单
	public  OrderLine  findById(Integer id)throws  ManagerOrderLineException;
	public void delete(OrderLine orderLine)throws  ManagerOrderLineException;
	public void update(OrderLine orderLine)throws  ManagerOrderLineException;
}