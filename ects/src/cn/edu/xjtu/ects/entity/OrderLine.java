package cn.edu.xjtu.ects.entity;

public class OrderLine {
	private int id;
	private int amount;
	
	private Product product;
	private Order order;
	
	/*getºÍsetº¯Êý*/
	public Integer getOrderLine_id() {
		return id;
	}
	public void setOrderLine_id(Integer orderLine_id) {
		this.id = orderLine_id;
	}
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

}
