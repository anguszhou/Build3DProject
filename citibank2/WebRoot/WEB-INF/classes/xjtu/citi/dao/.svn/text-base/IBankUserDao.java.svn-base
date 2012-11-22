package xjtu.citi.dao;

import java.util.Collection;
import java.util.List;
import xjtu.citi.entity.BankUser;
import xjtu.citi.exception.ManagerUserException;

public interface IBankUserDao {
	//添加用户
	public void add(BankUser user) throws ManagerUserException;
	//删除用户
	public void delete(BankUser user) throws ManagerUserException;
	//更新用户信息
	public void update(BankUser user) throws ManagerUserException;
	//查询所有的用户
	public Collection findAll() throws ManagerUserException;
	//根据ID号进行查找用户
	public BankUser findById(Integer id) throws ManagerUserException;
	//用户登录
	public  BankUser  login(String name, String passwd)throws ManagerUserException;
	//判断是否有同名用户
	public  List  login(String name)throws ManagerUserException;
	
	public  int   getTotal()throws  ManagerUserException;
	
	public  Collection   search(BankUser user)throws  ManagerUserException;

	
	//以下为分页方法的接口
	public  Collection   find(int start, int max)throws  ManagerUserException;

}
