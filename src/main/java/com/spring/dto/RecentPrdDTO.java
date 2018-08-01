package com.spring.dto;

public class RecentPrdDTO {
	
	private int recent_idx;
	private int pro_idx;
	private String mem_id;
	private String img_main;
	
	
	public String getImg_main() {
		return img_main;
	}
	public void setImg_main(String img_main) {
		this.img_main = img_main;
	}
	public int getRecent_idx() {
		return recent_idx;
	}
	public void setRecent_idx(int recent_idx) {
		this.recent_idx = recent_idx;
	}
	public int getPro_idx() {
		return pro_idx;
	}
	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

}
