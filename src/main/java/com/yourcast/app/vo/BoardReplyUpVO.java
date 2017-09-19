package com.yourcast.app.vo;

public class BoardReplyUpVO {

	private int m_num;
	private int br_num;
	
	BoardReplyUpVO(){}

	public BoardReplyUpVO(int m_num, int br_num) {
		super();
		this.m_num = m_num;
		this.br_num = br_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getBr_num() {
		return br_num;
	}

	public void setBr_num(int br_num) {
		this.br_num = br_num;
	}
	
	
}
