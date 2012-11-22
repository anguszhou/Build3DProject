package cn.edu.xjtu.ects.dao;

import java.util.Collection;

import cn.edu.xjtu.ects.entity.ProductClass;
import cn.edu.xjtu.ects.entity.Property;
import cn.edu.xjtu.ects.exception.ManagerProductException;

public interface IPropertyDao {

	public  Property  findById(Integer id )throws ManagerProductException;
	public  Collection  findByProduct( )throws ManagerProductException;
	public void addProperty(Property property)throws ManagerProductException;
	public void delete(Property property) throws ManagerProductException;
	public void update(Property property) throws ManagerProductException;
	public Property findByName(String name,int id) throws ManagerProductException;
}
