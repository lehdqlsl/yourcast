package com.yourcast.app.vo;

import java.util.Date;

public class ExchangeVO {
	private int e_num;
	private int e_count;
	private double e_ea;
	private Date e_regdate;
	private int m_num;

	public ExchangeVO(int e_num, int e_count, double e_ea, Date e_regdate, int m_num) {
		super();
		this.e_num = e_num;
		this.e_count = e_count;
		this.e_ea = e_ea;
		this.e_regdate = e_regdate;
		this.m_num = m_num;
	}

	public ExchangeVO() {
		// TODO Auto-generated constructor stub
	}

	public int getE_num() {
		return e_num;
	}

	public void setE_num(int e_num) {
		this.e_num = e_num;
	}

	public int getE_count() {
		return e_count;
	}

	public void setE_count(int e_count) {
		this.e_count = e_count;
	}

	public double getE_ea() {
		return e_ea;
	}

	public void setE_ea(int e_ea) {
		this.e_ea = e_ea;
	}

	public Date getE_regdate() {
		return e_regdate;
	}

	public void setE_regdate(Date e_regdate) {
		this.e_regdate = e_regdate;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
}
