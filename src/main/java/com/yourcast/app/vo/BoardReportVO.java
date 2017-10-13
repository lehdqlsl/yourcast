package com.yourcast.app.vo;

public class BoardReportVO {
	private int b_num;
	private int m_num;
	private String id;
	public BoardReportVO() {}
	
	public BoardReportVO(int b_num, int m_num) {
		super();
		this.b_num = b_num;
		this.m_num = m_num;
	}

	public BoardReportVO(int b_num, int m_num,String id) {
		super();
		this.b_num = b_num;
		this.m_num = m_num;
		this.id = id;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
