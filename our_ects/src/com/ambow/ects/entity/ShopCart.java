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
	 * �˷���Ϊ���ﳵ������һ����Ʒ,����ʱ��Ҫ������Ʒ���ظ���
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
	 * �˷���Ϊ���ﳵ��ɾ��һ����Ʒ
	 */

	public void remove(OrderLine line) {
		Integer product_id = line.getProduct().getId();
		items.remove(product_id);
	}
	public void remove(Integer id) {
		items.remove(id);
	}
	/*
	 * �˷���Ϊ�޸Ĺ��ﳵ����Ʒ����
	 */
	public void   modify(OrderLine line) {
		Integer product_id = line.getProduct().getId();
		items.put(product_id , line );
	}
     /*
      * ȡ�ù��ﳵ���ܼ۸�
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
     * ȡ�ù��ﳵ����Ʒ�ܼ���
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
	 * �˷�������ȡ�ù��ﳵ�е����������
	 */
	public int getSize() {
		return items.size();
	}
	/*
	 * �˷������ڽ����ﳵת����һ�Ŷ���
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
	 * �˷���������չ��ﳵ
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
