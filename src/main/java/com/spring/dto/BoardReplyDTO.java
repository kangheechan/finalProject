package com.spring.dto;

import java.sql.Date;

public class BoardReplyDTO {
	
	private int breply_idx;
	private String breply_content;
	private Date breply_date;
	private String mem_id;
	private int req_idx;
	
	public int getBreply_idx() {
		return breply_idx;
	}
	public void setBreply_idx(int breply_idx) {
		this.breply_idx = breply_idx;
	}
	public String getBreply_content() {
		return breply_content;
	}
	public void setBreply_content(String breply_content) {
		this.breply_content = breply_content;
	}
	public Date getBreply_date() {
		return breply_date;
	}
	public void setBreply_date(Date breply_date) {
		this.breply_date = breply_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getReq_idx() {
		return req_idx;
	}
	public void setReq_idx(int req_idx) {
		this.req_idx = req_idx;
	}
	

}
