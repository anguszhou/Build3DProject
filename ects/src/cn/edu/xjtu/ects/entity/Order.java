package cn.edu.xjtu.ects.entity;

import java.util.HashSet;
import java.util.Set;

public class Order {
	private int order_id;//����ID
	private String name;//������
	private double cost;//����
	
	private User user;//�����û�
	private OrderStatus orderStatus;//����״̬
	private Set orderLines = new HashSet();//���嶩����
	
	/*���캯��*/
	public Order(int order_id, String name, double cost, User user,
			OrderStatus orderStatus, Set orderLines) {
		super();
		this.order_id = order_id;
		this.name = name;
		this.cost = cost;
		this.user = user;
		this.orderStatus = orderStatus;
		this.orderLines = orderLines;
	}
	public Order() {
		// TODO Auto-generated constructor stub
	}
	/*get��set����*/
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public OrderStatus getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Set getOrderLines() {
		return orderLines;
	}
	public void setOrderLines(Set orderLines) {
		this.orderLines = orderLines;
	}
	

}
