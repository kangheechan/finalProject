package com.spring.dto;

import java.sql.Date;

public class WalletDTO {
	private int wallet_idx;
	private String mem_id;
	private int pro_idx;
	private Date wallet_date;
	private String pro_name;
	private int shop_idx;
	
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public Date getWallet_date() {
		return wallet_date;
	}
	public void setWallet_date(Date wallet_date) {
		this.wallet_date = wallet_date;
	}
	public int getWallet_idx() {
		return wallet_idx;
	}
	public void setWallet_idx(int wallet_idx) {
		this.wallet_idx = wallet_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getPro_idx() {
		return pro_idx;
	}
	public void setPro_idx(int prd_idx) {
		this.pro_idx = prd_idx;
	}
	public int getShop_idx() {
		return shop_idx;
	}
	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}
}
