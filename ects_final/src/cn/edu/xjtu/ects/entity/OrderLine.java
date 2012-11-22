package cn.edu.xjtu.ects.entity;

public class OrderLine {
	private int id;
	private int amount;
	
	private Product product;
	private Order order;
	
	/*getºÍsetº¯Êý*/
	
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

}
