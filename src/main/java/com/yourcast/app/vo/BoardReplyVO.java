package com.yourcast.app.vo;

import java.sql.Date;

public class BoardReplyVO {
	private int br_num;
	private String br_content;
	private Date br_regdate;
	private int br_delete;
	private int b_num;
	private int m_num;
	
	public BoardReplyVO() {
		
	}

	public BoardReplyVO(int br_num, String br_content, Date br_regdate, int br_delete, int b_num, int m_num) {
		super();
		this.br_num = br_num;
		this.br_content = br_content;
		this.br_regdate = br_regdate;
		this.br_delete = br_delete;
		this.b_num = b_num;
		this.m_num = m_num;
	}

	public int getBr_num() {
		return br_num;
	}

	public void setBr_num(int br_num) {
		this.br_num = br_num;
	}

	public String getBr_content() {
		return br_content;
	}

	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}

	public Date getBr_regdate() {
		return br_regdate;
	}

	public void setBr_regdate(Date br_regdate) {
		this.br_regdate = br_regdate;
	}

	public int getBr_delete() {
		return br_delete;
	}

	public void setBr_delete(int br_delete) {
		this.br_delete = br_delete;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}


}
