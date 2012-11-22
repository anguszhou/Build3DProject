package cn.edu.xjtu.ects.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;



public class Product {
	private int product_id;//商品ID
	private String name;//商品名
	private double price;//商品价格
	private Date time ; //商品上架时间
	
	private ProductClass productClass;//所属二级分类
	private Seller seller;//所属卖家
	private Set propertys = new HashSet();//商品属性
	private Set comments = new HashSet();//商品评论
	private  StarRating starRating;  //商品评分
	
	/*构造函数*/
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Product(int product_id, String name, double price, Date time,
			ProductClass productClass, Seller seller, Set propertys,
			Set comments,StarRating starRating)
	{
		super();
		this.product_id = product_id;
		this.name = name;
		this.price = price;
		this.time = time;
		this.productClass = productClass;
		this.seller = seller;
		this.propertys = propertys;
		this.comments = comments;
		this.starRating = starRating;
	}

	/*get和set函数*/
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public Date getTime()
	{
		return time;
	}

	public void setTime(Date time)
	{
		this.time = time;
	}

	public ProductClass getProductClass() {
		return productClass;
	}
	public void setProductClass(ProductClass productClass) {
		this.productClass = productClass;
	}
	public Seller getSeller() {
		return seller;
	}
	public void setSeller(Seller seller) {
		this.seller = seller;
	}
	public Set getPropertys() {
		return propertys;
	}
	public void setPropertys(Set propertys) {
		this.propertys = propertys;
	}
	public Set getComments() {
		return comments;
	}
	public void setComments(Set comments) {
		this.comments = comments;
	}
	public StarRating getStarRating()
	{
		return starRating;
	}

	public void setStarRating(StarRating starRating)
	{
		this.starRating = starRating;
	}
	

	
	

}
