package cn.edu.xjtu.ects.entity;

import java.util.HashSet;
import java.util.Set;

public class ProductClass {
	private int productClass_id;//二级分类ID
	private String name;//二级分类名称
	
	private Category category;//所属类别
	private Set products = new HashSet();//所含商品
	
	/*构造函数*/
	public ProductClass() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductClass(int productClass_id, String name, Category category,
			Set products) {
		super();
		this.productClass_id = productClass_id;
		this.name = name;
		this.category = category;
		this.products = products;
	}
	/*get和set函数*/
	public int getProductClass_id() {
		return productClass_id;
	}
	public void setProductClass_id(Integer productClass_id) {
		this.productClass_id = productClass_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Set getProducts() {
		return products;
	}
	public void setProducts(Set products) {
		this.products = products;
	}
	

}
