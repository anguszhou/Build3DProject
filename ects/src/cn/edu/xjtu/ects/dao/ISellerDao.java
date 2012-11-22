package cn.edu.xjtu.ects.dao;

import java.util.Collection;
import java.util.List;

import cn.edu.xjtu.ects.entity.Seller;

import cn.edu.xjtu.ects.exception.ManagerUserException;

public interface ISellerDao {
	//添加卖家
	public void add(Seller seller) throws ManagerUserException;	
	//删除卖家
	public void delete(Seller seller) throws ManagerUserException;
	//更新卖家信息
	public void update(Seller seller) throws ManagerUserException;
	//查询所有的卖家
	public Collection findAll() throws ManagerUserException;
	//根据ID号进行查找卖家
	public Seller findById(Integer id) throws ManagerUserException;
	//用户登录
	public  Seller  login(String name, String passwd)throws ManagerUserException;
	//判断是否有同名卖家
	public  List  login(String name)throws ManagerUserException;
	
	public  int   getTotal()throws  ManagerUserException;
	
	//以下为分页方法的接口
	public  Collection   find(int start, int max)throws  ManagerUserException;

}
