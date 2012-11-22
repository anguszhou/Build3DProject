 package cn.edu.xjtu.ects.dao;
import java.util.Collection;

import cn.edu.xjtu.ects.exception.ManagerOrderException;
import cn.edu.xjtu.ects.exception.ManagerOrderLineException;
 
import cn.edu.xjtu.ects.entity.OrderLine;

 


public interface IOrderLineDao {
	//��Ӷ���
	public  void  addOrderLine(OrderLine orderLine)throws ManagerOrderLineException;
	//�ҳ���Ϊuser_name�����ж���
	public  Collection  findAll(String user_name)throws ManagerOrderLineException;
	//�ҳ�id�Ķ���
	public  OrderLine  findById(Integer id)throws  ManagerOrderLineException;
	public void delete(OrderLine orderLine)throws  ManagerOrderLineException;
	public void update(OrderLine orderLine)throws  ManagerOrderLineException;
}