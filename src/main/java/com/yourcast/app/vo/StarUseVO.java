package com.yourcast.app.vo;

import java.sql.Date;

public class StarUseVO {

	private int use_num;
	private Date use_regdate;
	private int use_ea;
	private int m_num;
	private int bj_num;
	
	public StarUseVO() {}

	public StarUseVO(int use_num, Date use_regdate, int use_ea, int m_num, int bj_num) {
		super();
		this.use_num = use_num;
		this.use_regdate = use_regdate;
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

	public Date getUse_regdate() {
		return use_regdate;
	}

	public void setUse_regdate(Date use_regdate) {
		this.use_regdate = use_regdate;
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
