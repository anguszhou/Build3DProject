package cn.edu.xjtu.ects.entity;

import java.util.HashSet;
import java.util.Set;

public class Order {
	private int order_id;//订单ID
	private String name;//订单名
	private double cost;//费用
	
	private User user;//订单用户
	private OrderStatus orderStatus;//订单状态
	private Set orderLines = new HashSet();//具体订单项
	
	/*构造函数*/
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
	/*get和set函数*/
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
