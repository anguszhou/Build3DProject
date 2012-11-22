package com.ambow.ects.dao;

import java.util.List;

import com.ambow.ecport.exception.ManagerUserException;
import com.ambow.ects.entity.User;



public interface IUserDao {

	public void add(User user) throws ManagerUserException;

	//public void delete(User user) throws ManagerUserException;

	public void update(User user) throws ManagerUserException;

	//public Collection findAll() throws ManagerUserException;

	public User findById(Integer id) throws ManagerUserException;

	public  User  login(String name, String passwd)throws ManagerUserException;
	
	public  List  login(String name)throws ManagerUserException;
}
