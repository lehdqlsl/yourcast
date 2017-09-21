package com.yourcast.app.vo;

public class SubscribeVO {
	private int m_num;
	private int bj_num;

	public SubscribeVO(int m_num, int bj_num) {
		super();
		this.m_num = m_num;
		this.bj_num = bj_num;
	}

	public SubscribeVO() {
		// TODO Auto-generated constructor stub
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

}
