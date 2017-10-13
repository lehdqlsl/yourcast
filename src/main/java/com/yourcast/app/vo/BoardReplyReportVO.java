package com.yourcast.app.vo;

public class BoardReplyReportVO {
	private int br_num;
	private int m_num;
	private String id;

	public BoardReplyReportVO(int br_num, int m_num, String id) {
		super();
		this.br_num = br_num;
		this.m_num = m_num;
		this.id = id;
	}

	public BoardReplyReportVO(int br_num, int m_num) {
		super();
		this.br_num = br_num;
		this.m_num = m_num;
	}

	public BoardReplyReportVO() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBr_num() {
		return br_num;
	}

	public void setBr_num(int br_num) {
		this.br_num = br_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
}
