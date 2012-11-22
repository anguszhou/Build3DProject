package cn.edu.xjtu.ects.dao;

import java.util.Collection;
import java.util.List;

import cn.edu.xjtu.ects.entity.Seller;

import cn.edu.xjtu.ects.exception.ManagerUserException;

public interface ISellerDao {
	//�������
	public void add(Seller seller) throws ManagerUserException;	
	//ɾ������
	public void delete(Seller seller) throws ManagerUserException;
	//����������Ϣ
	public void update(Seller seller) throws ManagerUserException;
	//��ѯ���е�����
	public Collection findAll() throws ManagerUserException;
	//����ID�Ž��в�������
	public Seller findById(Integer id) throws ManagerUserException;
	//�û���¼
	public  Seller  login(String name, String passwd)throws ManagerUserException;
	//�ж��Ƿ���ͬ������
	public  List  login(String name)throws ManagerUserException;
	
	public  int   getTotal()throws  ManagerUserException;
	
	//����Ϊ��ҳ�����Ľӿ�
	public  Collection   find(int start, int max)throws  ManagerUserException;

}
