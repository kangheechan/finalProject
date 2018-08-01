package com.spring.dto;

import java.sql.Date;

public class ShopReplyDTO {
	private int sreply_idx;
	private String sreply_content;
	private Date sreply_date;
	private String mem_id;
	private int shop_idx;
	private int sreply_star;
	
	public int getSreply_idx() {
		return sreply_idx;
	}
	public void setSreply_idx(int sreply_idx) {
		this.sreply_idx = sreply_idx;
	}
	public String getSreply_content() {
		return sreply_content;
	}
	public void setSreply_content(String sreply_content) {
		this.sreply_content = sreply_content;
	}
	public Date getSreply_date() {
		return sreply_date;
	}
	public void setSreply_date(Date sreply_date) {
		this.sreply_date = sreply_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getShop_idx() {
		return shop_idx;
	}
	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}
	public int getSreply_star() {
		return sreply_star;
	}
	public void setSreply_star(int sreply_star) {
		this.sreply_star = sreply_star;
	}
	
}
