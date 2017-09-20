package com.yourcast.app.vo;

import java.sql.Date;

public class NoticeVO {
	private int n_num;
	private String n_title;
	private String n_content;
	private Date n_regdate;
	private int a_num;
	
	public NoticeVO() {
		
	}

	public NoticeVO(int n_num, String n_title, String n_content, Date n_regdate, int a_num) {
		super();
		this.n_num = n_num;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_regdate = n_regdate;
		this.a_num = a_num;
	}

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Date getN_regdate() {
		return n_regdate;
	}

	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}

	public int getA_num() {
		return a_num;
	}

	public void setA_num(int a_num) {
		this.a_num = a_num;
	}
	
}