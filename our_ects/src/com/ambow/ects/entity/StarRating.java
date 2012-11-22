package com.ambow.ects.entity;

import java.io.Serializable;

public class StarRating  implements  Serializable{

	private   Integer  id;//产品关联ID
	private   Integer  personNum = 0;//评分的人数
	private   Integer  totalStar = 0;//评分总数
	private   double  avgStar = 0.0;//平均分数
	
	private   Product  product;
	
	
	
	public StarRating(Integer id, Integer personNum, Integer totalStar,
			double avgStar, Product product)
	{
		super();
		this.id = id;
		this.personNum = personNum;
		this.totalStar = totalStar;
		this.avgStar = avgStar;
		this.product = product;
	}

	public StarRating()
	{
		super();
	}

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Integer getPersonNum()
	{
		return personNum;
	}

	public void setPersonNum(Integer personNum)
	{
		this.personNum = personNum;
	}

	public Integer getTotalStar()
	{
		return totalStar;
	}

	public void setTotalStar(Integer totalStar)
	{
		this.totalStar = totalStar;
	}

	
	public Product getProduct()
	{
		return product;
	}

	public void setProduct(Product product)
	{
		this.product = product;
	}

	public double getAvgStar()
	{
		return avgStar;
	}

	public void setAvgStar(double avgStar)
	{
		this.avgStar = avgStar;
	}
   
	
}
