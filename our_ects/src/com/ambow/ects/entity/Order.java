package com.ambow.ects.entity;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Order {

	private  Integer  id;
	private  String  name;
	private  double  cost;
	
	private   User   user;
	private   PayWay payWay ;
	private   OrderStatus status ;
	private  Set   orderlines = new HashSet();
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set getOrderlines() {
		return orderlines;
	}
	public void setOrderlines(Set orderlines) {
		this.orderlines = orderlines;
	}
	public PayWay getPayWay() {
		return payWay;
	}
	public void setPayWay(PayWay payWay) {
		this.payWay = payWay;
	}
	public OrderStatus getStatus() {
		return status;
	}
	public void setStatus(OrderStatus status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int  getCount(){
		int  count = 0;
		Iterator it = orderlines.iterator();
		while(it.hasNext()){
			OrderLine line = (OrderLine) it.next();
			count +=  line.getAmount();
		}
		return  count;
	}
	
}
