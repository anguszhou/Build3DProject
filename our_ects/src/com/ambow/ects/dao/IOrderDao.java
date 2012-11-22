package com.ambow.ects.dao;


import java.util.Collection;

import com.ambow.ecport.exception.ManagerOrderException;
import com.ambow.ects.entity.Order;



public interface  IOrderDao {

	public  void  addOrder(Order order)throws ManagerOrderException;
	public  Collection  findAll(String   user_name)throws ManagerOrderException;
	public  Order  findById(Integer id)throws  ManagerOrderException;
}
