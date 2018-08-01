package com.spring.dto;

import java.sql.Date;

public class BlackListDTO {
	
	private int blackmem_idx;
	private Date blackmem_date;
	private String mem_id;
	
	
	public int getBlackmem_idx() {
		return blackmem_idx;
	}
	public void setBlackmem_idx(int blackmem_idx) {
		this.blackmem_idx = blackmem_idx;
	}
	public Date getBlackmem_date() {
		return blackmem_date;
	}
	public void setBlackmem_date(Date blackmem_date) {
		this.blackmem_date = blackmem_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	

}
