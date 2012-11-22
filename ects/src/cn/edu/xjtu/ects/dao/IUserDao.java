package cn.edu.xjtu.ects.dao;

import java.util.Collection;
import java.util.List;

import cn.edu.xjtu.ects.exception.ManagerProductException;
import cn.edu.xjtu.ects.exception.ManagerUserException;
import cn.edu.xjtu.ects.entity.User;

public interface IUserDao {
	//添加用户
	public void add(User user) throws ManagerUserException;
	//删除用户
	public void delete(User user) throws ManagerUserException;
	//更新用户信息
	public void update(User user) throws ManagerUserException;
	//查询所有的用户
	public Collection findAll() throws ManagerUserException;
	//根据ID号进行查找用户
	public User findById(Integer id) throws ManagerUserException;
	//用户登录
	public  User  login(String name, String passwd)throws ManagerUserException;
	//判断是否有同名用户
	public  List  login(String name)throws ManagerUserException;
	
	public  int   getTotal()throws  ManagerUserException;
	
	//以下为分页方法的接口
	public  Collection   find(int start, int max)throws  ManagerUserException;

}
