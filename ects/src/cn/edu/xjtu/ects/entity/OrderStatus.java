package cn.edu.xjtu.ects.entity;

public class OrderStatus {
	private Integer orderStatus_id;//����״̬ID
	private String name;//����״̬��
	private String descriptions;//����״̬����
	
	/*get��set����*/
	
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

}
