package com.spring.dto;

import java.sql.Date;

public class ProductDTO {

	private String mem_phone;
	private String mem_addr;
	//상품 이미지 DTO
	private int img_idx;
	private String img_main;
	private String img_sub;
	//상품
	private int pro_idx;
	private int pro_price;
	private String pro_name;
	private Date pro_date;
	private String pro_state;
	private String pro_size;
	private String pro_memo;
	private int shop_idx;
	private int brand_idx;
	private int gender_idx;
	private int shoes_idx;
	private String mem_id;
	
	public int getImg_idx() {
		return img_idx;
	}
	public void setImg_idx(int img_idx) {
		this.img_idx = img_idx;
	}
	public String getImg_main() {
		return img_main;
	}
	public void setImg_main(String img_main) {
		this.img_main = img_main;
	}
	public String getImg_sub() {
		return img_sub;
	}
	public void setImg_sub(String img_sub) {
		this.img_sub = img_sub;
	}
	public int getPro_idx() {
		return pro_idx;
	}
	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public Date getPro_date() {
		return pro_date;
	}
	public void setPro_date(Date pro_date) {
		this.pro_date = pro_date;
	}
	public String getPro_state() {
		return pro_state;
	}
	public void setPro_state(String pro_state) {
		this.pro_state = pro_state;
	}
	public String getPro_size() {
		return pro_size;
	}
	public void setPro_size(String pro_size) {
		this.pro_size = pro_size;
	}
	public String getPro_memo() {
		return pro_memo;
	}
	public void setPro_memo(String pro_memo) {
		this.pro_memo = pro_memo;
	}
	public int getShop_idx() {
		return shop_idx;
	}
	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}
	public int getBrand_idx() {
		return brand_idx;
	}
	public void setBrand_idx(int brand_idx) {
		this.brand_idx = brand_idx;
	}
	public int getGender_idx() {
		return gender_idx;
	}
	public void setGender_idx(int gender_idx) {
		this.gender_idx = gender_idx;
	}
	public int getShoes_idx() {
		return shoes_idx;
	}
	public void setShoes_idx(int shoes_idx) {
		this.shoes_idx = shoes_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	
	
}
