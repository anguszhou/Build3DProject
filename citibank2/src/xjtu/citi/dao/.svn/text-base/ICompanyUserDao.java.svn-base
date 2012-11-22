package xjtu.citi.dao;

import java.util.Collection;
import java.util.List;

import xjtu.citi.entity.CompanyUser;
import xjtu.citi.exception.ManagerUserException;

public interface ICompanyUserDao {
	//添加用户
	public void add(CompanyUser user) throws ManagerUserException;
	//删除用户
	public void delete(CompanyUser user) throws ManagerUserException;
	//更新用户信息
	public void update(CompanyUser user) throws ManagerUserException;
	//查询所有的用户
	public Collection findAll() throws ManagerUserException;
	//根据ID号进行查找用户
	public CompanyUser findById(Integer id) throws ManagerUserException;
	//用户登录
	public  CompanyUser  login(String name, String passwd)throws ManagerUserException;
	//判断是否有同名用户
	public  List  login(String name)throws ManagerUserException;
	
	public  int   getTotal()throws  ManagerUserException;
	
	public  Collection   search(CompanyUser user)throws  ManagerUserException;

	
	//以下为分页方法的接口
	public  Collection   find(int start, int max)throws  ManagerUserException;

}
