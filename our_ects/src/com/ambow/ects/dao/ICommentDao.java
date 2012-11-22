package com.ambow.ects.dao;

import java.util.Collection;

import com.ambow.ecport.exception.ManagerProductException;
import com.ambow.ects.entity.Comment;

public interface ICommentDao
{
	public  Collection  findByProductId(Integer  id )throws ManagerProductException;
	public  void addComment(Comment comment)throws ManagerProductException;
}
