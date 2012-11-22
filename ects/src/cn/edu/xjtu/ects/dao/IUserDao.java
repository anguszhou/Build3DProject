package cn.edu.xjtu.ects.dao;

import java.util.Collection;
import java.util.List;

import cn.edu.xjtu.ects.exception.ManagerProductException;
import cn.edu.xjtu.ects.exception.ManagerUserException;
import cn.edu.xjtu.ects.entity.User;

public interface IUserDao {
	//����û�
	public void add(User user) throws ManagerUserException;
	//ɾ���û�
	public void delete(User user) throws ManagerUserException;
	//�����û���Ϣ
	public void update(User user) throws ManagerUserException;
	//��ѯ���е��û�
	public Collection findAll() throws ManagerUserException;
	//����ID�Ž��в����û�
	public User findById(Integer id) throws ManagerUserException;
	//�û���¼
	public  User  login(String name, String passwd)throws ManagerUserException;
	//�ж��Ƿ���ͬ���û�
	public  List  login(String name)throws ManagerUserException;
	
	public  int   getTotal()throws  ManagerUserException;
	
	//����Ϊ��ҳ�����Ľӿ�
	public  Collection   find(int start, int max)throws  ManagerUserException;

}
