package com.ambow.ects.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class Comment implements  Serializable{

	private  Integer id;
	private  String  name;	
	private  String  email="";	
	private  String  content="";		
	private  Date    commentDate;
	
	private  Product  product;

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public Date getCommentDate()
	{
		return commentDate;
	}

	public void setCommentDate(Date commentDate)
	{
		this.commentDate = commentDate;
	}

	public Product getProduct()
	{
		return product;
	}

	public void setProduct(Product product)
	{
		this.product = product;
	}

	public Comment(Integer id, String name, String email, String content,
			Date commentDate, Product product)
	{
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.content = content;
		this.commentDate = commentDate;
		this.product = product;
	}
	
	public Comment()
	{

	}
}
