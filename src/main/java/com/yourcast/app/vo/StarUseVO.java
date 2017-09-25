package com.yourcast.app.vo;

public class StarUseVO {

	private int use_num;
	private String use_regString;
	private int use_ea;
	private int m_num;
	private int bj_num;
	
	public StarUseVO() {}

	public StarUseVO(int use_num, String use_regString, int use_ea, int m_num, int bj_num) {
		super();
		this.use_num = use_num;
		this.use_regString = use_regString;
		this.use_ea = use_ea;
		this.m_num = m_num;
		this.bj_num = bj_num;
	}

	public int getUse_num() {
		return use_num;
	}

	public void setUse_num(int use_num) {
		this.use_num = use_num;
	}

	public String getUse_regString() {
		return use_regString;
	}

	public void setUse_regString(String use_regString) {
		this.use_regString = use_regString;
	}

	public int getUse_ea() {
		return use_ea;
	}

	public void setUse_ea(int use_ea) {
		this.use_ea = use_ea;
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
