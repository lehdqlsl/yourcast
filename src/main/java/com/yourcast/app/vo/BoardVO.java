package com.yourcast.app.vo;

import java.sql.Date;

public class BoardVO {
	private int b_num;
	private String b_title;
	private String b_content;
	private Date b_regdate;
	private int b_hit;
	private int b_notice;
	private int b_delete;
	private int m_num;
	private int bj_num;
	private int category_num;
	
	public BoardVO() {}
	
	public BoardVO(int b_num, String b_title, String b_content, Date b_regdate, int b_hit, int b_notice, int b_delete,
			int m_num, int bj_num, int category_num) {
		super();
		this.b_num = b_num;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_regdate = b_regdate;
		this.b_hit = b_hit;
		this.b_notice = b_notice;
		this.b_delete = b_delete;
		this.m_num = m_num;
		this.bj_num = bj_num;
		this.category_num = category_num;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Date getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	public int getB_notice() {
		return b_notice;
	}
	public void setB_notice(int b_notice) {
		this.b_notice = b_notice;
	}
	public int getB_delete() {
		return b_delete;
	}
	public void setB_delete(int b_delete) {
		this.b_delete = b_delete;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getBj_num() {
		return bj_num;
	}
	public void setBj_num(int bj_num) {
		this.bj_num = bj_num;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
}
