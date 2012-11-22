package com.ambow.ects.entity;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class ShopCart {

	private Map items = new HashMap();

	/*
	 * 此方法为向购物车中增加一件商品,增加时需要考虑商品的重复性
	 */
	public void add(OrderLine line) {
		Integer product_id = line.getProduct().getId();
		OrderLine orderLine = (OrderLine) items.get(product_id);
		if (orderLine == null) {
			items.put(product_id, line);
		} else {
			orderLine.setAmount(orderLine.getAmount() + line.getAmount());
			items.put(product_id, orderLine);
		}
	}

	/*
	 * 此方法为向购物车中删除一件商品
	 */

	public void remove(OrderLine line) {
		Integer product_id = line.getProduct().getId();
		items.remove(product_id);
	}
	public void remove(Integer id) {
		items.remove(id);
	}
	/*
	 * 此方法为修改购物车中商品数量
	 */
	public void   modify(OrderLine line) {
		Integer product_id = line.getProduct().getId();
		items.put(product_id , line );
	}
     /*
      * 取得购物车中总价格
      */
	public  double   getTotal(){
		double total = 0;
		Set  set = items.keySet();
		Iterator it = set.iterator();
		while(it.hasNext()){
			Integer id =(Integer)it.next();
			OrderLine line = (OrderLine) items.get(id);
			total += line.getProduct().getBasePrice() * line.getAmount();
		}
		return  total;
	}
	/*
     * 取得购物车中商品总件数
     */
	public  int   getCount(){
		int count = 0;
		Set  set = items.keySet();
		Iterator it = set.iterator();
		while(it.hasNext()){
			Integer id =(Integer)it.next();
			OrderLine line = (OrderLine) items.get(id);
			count +=  line.getAmount();
		}
		return  count;
	}
	/*
	 * 此方法用于取得购物车中的种类的数量
	 */
	public int getSize() {
		return items.size();
	}
	/*
	 * 此方法用于将购物车转化成一张订单
	 */
	public  Order  getOrder(){
		Order  order = new Order();
		Set  set = new HashSet();
		Collection list = items.values();
		set.addAll(list);
		order.setOrderlines(set);
		order.setCost(this.getTotal());
		return  order;
	}
	/*
	 * 此方法用于清空购物车
	 */
	public   void  clearCart(){
		items.clear();
	}

	public Map getItems() {
		return items;
	}

	public void setItems(Map items) {
		this.items = items;
	}
	
}
