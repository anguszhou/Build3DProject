package cn.edu.xjtu.ects.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;



public class Product {
	private int product_id;//��ƷID
	private String name;//��Ʒ��
	private double price;//��Ʒ�۸�
	private Date time ; //��Ʒ�ϼ�ʱ��
	private String descriptions;//��Ʒ��ϸ����
	
	private ProductClass productClass;//������������
	private Seller seller;//��������
	private Set propertys = new HashSet();//��Ʒ����
	private Set comments = new HashSet();//��Ʒ����
	private  StarRating starRating;  //��Ʒ����
	
	/*���캯��*/
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Product(int product_id, String name, double price, Date time,String descriptions,
			ProductClass productClass, Seller seller, Set propertys,
			Set comments,StarRating starRating)
	{
		super();
		this.product_id = product_id;
		this.name = name;
		this.price = price;
		this.time = time;
		this.descriptions = descriptions;
		this.productClass = productClass;
		this.seller = seller;
		this.propertys = propertys;
		this.comments = comments;
		this.starRating = starRating;
	}

	/*get��set����*/
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

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}
	

	
	

}
