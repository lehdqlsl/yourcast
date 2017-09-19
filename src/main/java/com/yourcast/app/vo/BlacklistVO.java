package com.yourcast.app.vo;

public class BlacklistVO {

	private int bl_num;
	private int m_num;
	private int bj_num;
	
	public BlacklistVO() {}

	public BlacklistVO(int bl_num, int m_num, int bj_num) {
		super();
		this.bl_num = bl_num;
		this.m_num = m_num;
		this.bj_num = bj_num;
	}

	public int getBl_num() {
		return bl_num;
	}

	public void setBl_num(int bl_num) {
		this.bl_num = bl_num;
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
