package com.spring.dto;

import java.sql.Date;

public class RequestBoardDTO {
	
	private int req_idx;
	private String req_subject;
	private String req_content;
	private Date req_date;
	private String mem_id;
	private String rimg_path;
	
	
	public String getRimg_path() {
		return rimg_path;
	}
	public void setRimg_path(String rimg_path) {
		this.rimg_path = rimg_path;
	}
	private int bHit;
	
	public int getReq_idx() {
		return req_idx;
	}
	public void setReq_idx(int req_idx) {
		this.req_idx = req_idx;
	}
	public String getReq_subject() {
		return req_subject;
	}
	public void setReq_subject(String req_subject) {
		this.req_subject = req_subject;
	}
	public String getReq_content() {
		return req_content;
	}
	public void setReq_content(String req_content) {
		this.req_content = req_content;
	}
	public Date getReq_date() {
		return req_date;
	}
	public void setReq_date(Date req_date) {
		this.req_date = req_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	
}
