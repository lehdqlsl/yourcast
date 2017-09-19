package com.yourcast.app.vo;

public class BoardUpVO {
	private int m_num;
	private int b_num;

	public BoardUpVO(int m_num, int b_num) {
		super();
		this.m_num = m_num;
		this.b_num = b_num;
	}

	public BoardUpVO() {
		// TODO Auto-generated constructor stub
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

}
