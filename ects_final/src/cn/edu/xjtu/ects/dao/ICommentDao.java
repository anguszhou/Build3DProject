package cn.edu.xjtu.ects.dao;

import java.util.Collection;

import cn.edu.xjtu.ects.entity.Comment;
import cn.edu.xjtu.ects.exception.ManagerProductException;

public interface ICommentDao {
	//查询商品的所有评论
	public Collection findByProduct_id(Integer id)throws ManagerProductException;
	//增加评论
	public void addComment(Comment comment)throws ManagerProductException;

}
