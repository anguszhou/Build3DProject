package cn.edu.xjtu.ects.entity;

public class OrderStatus {
	private Integer orderStatus_id;//¶©µ¥×´Ì¬ID
	private String name;//¶©µ¥×´Ì¬Ãû
	private String descriptions;//¶©µ¥×´Ì¬ÃèÊö
	
	/*getºÍsetº¯Êý*/
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescriptions() {
		return descriptions;
	}
	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}
	public Integer getOrderStatus_id() {
		return orderStatus_id;
	}
	public void setOrderStatus_id(Integer orderStatus_id) {
		this.orderStatus_id = orderStatus_id;
	}
	public OrderStatus(Integer orderStatus_id, String name, String descriptions) {
		super();
		this.orderStatus_id = orderStatus_id;
		this.name = name;
		this.descriptions = descriptions;
	}
	public OrderStatus() {
		super();
		// TODO Auto-generated constructor stub
	}

}
