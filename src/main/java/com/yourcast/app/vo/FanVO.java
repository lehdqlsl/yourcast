package com.yourcast.app.vo;

public class FanVO {
	private int fan_num;
	private int m_num;
	private int bj_num;
	
	public FanVO() {}
	
	public FanVO(int fan_num, int m_num, int bj_num) {
		super();
		this.fan_num = fan_num;
		this.m_num = m_num;
		this.bj_num = bj_num;
	}
	public int getFan_num() {
		return fan_num;
	}
	public void setFan_num(int fan_num) {
		this.fan_num = fan_num;
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
