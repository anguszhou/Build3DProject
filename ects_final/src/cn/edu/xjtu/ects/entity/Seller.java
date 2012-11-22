package cn.edu.xjtu.ects.entity;

import java.util.HashSet;
import java.util.Set;

public class Seller extends User {
	private int user_id;
	private String realName;
	private String credit;
	private String shopName;
	private String QQ;
	private String shopDescriptions;
	
	private Set products = new HashSet();
	private User user;
	
	public Seller(int user_id, String realName, String credit, String shopName,
			String qq, String shopDescriptions, Set products, User user)
	{
		super();
		this.user_id = user_id;
		this.realName = realName;
		this.credit = credit;
		this.shopName = shopName;
		QQ = qq;
		this.shopDescriptions = shopDescriptions;
		this.products = products;
		this.user = user;
	}
	/*构造函数*/
	public Seller() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Seller(String name, String passwd) {
		super(name, passwd);
		// TODO Auto-generated constructor stub
	}
	
	public Seller(int user_id, String name, String passwd,
			ContactInfo contcatInfo, int id, String realName, String credit,
			String shopName, String shopDescriptions, Set products) {
		super(user_id, name, passwd, contcatInfo);
		this.user_id = id;
		this.realName = realName;
		this.credit = credit;
		this.shopName = shopName;
		this.shopDescriptions = shopDescriptions;
		this.products = products;
	}
	public Seller(int user_id, String name, String passwd,
			ContactInfo contcatInfo, int id, String realName, String credit,
			String shopName,String QQ, String shopDescriptions, Set products) {
		super(user_id, name, passwd, contcatInfo);
		this.user_id = id;
		this.realName = realName;
		this.credit = credit;
		this.shopName = shopName;
		this.QQ = QQ;
		this.shopDescriptions = shopDescriptions;
		this.products = products;
	}
	
	
	
	
	
	/*get和set函数*/
	public int getId() {
		return user_id;
	}
	public void setId(int id) {
		this.user_id = id;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getQQ() {
		return QQ;
	}
	public void setQQ(String qq) {
		QQ = qq;
	}
	public String getShopDescriptions() {
		return shopDescriptions;
	}
	public void setShopDescriptions(String shopDescriptions) {
		this.shopDescriptions = shopDescriptions;
	}
	public Set getProducts() {
		return products;
	}
	public void setProducts(Set products) {
		this.products = products;
	}
	
	
	

	
}
