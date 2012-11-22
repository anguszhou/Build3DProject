package com.ambow.ects.entity;

import java.io.Serializable;

public class Province  implements  Serializable{

	private   Integer  id;//省份ID，主键
	private   String  name;//省份名
	private   Country  country;//关联国家属性
	public Country getCountry() {
		return country;
	}
	public void setCountry(Country country) {
		this.country = country;
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
	public Province(Country country, String name) {
		super();
		this.country = country;
		this.name = name;
	}
	public Province() {
		super();
	}
	
	
}
