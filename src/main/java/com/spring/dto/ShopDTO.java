package com.spring.dto;

import java.sql.Date;

public class ShopDTO {
	private int shop_idx;
	private String shop_name;
	private int shop_score;
	private int shop_sellcount;
	private Date shop_date;
	private String shop_buyer;
	private String mem_id;
	
	public int getShop_idx() {
		return shop_idx;
	}
	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public int getShop_score() {
		return shop_score;
	}
	public void setShop_score(int shop_score) {
		this.shop_score = shop_score;
	}
	
	public Date getShop_date() {
		return shop_date;
	}
	public void setShop_date(Date shop_date) {
		this.shop_date = shop_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getShop_sellcount() {
		return shop_sellcount;
	}
	public void setShop_sellcount(int shop_sellcount) {
		this.shop_sellcount = shop_sellcount;
	}
	public String getShop_buyer() {
		return shop_buyer;
	}
	public void setShop_buyer(String shop_buyer) {
		this.shop_buyer = shop_buyer;
	}
	
	
}
