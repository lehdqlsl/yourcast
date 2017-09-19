package com.yourcast.app.vo;

import java.util.Date;

public class ExchangeVO {
	private int e_num;
	private int e_money;
	private int e_ea;
	private Date e_regdate;
	private int m_num;

	public ExchangeVO(int e_num, int e_money, int e_ea, Date e_regdate, int m_num) {
		super();
		this.e_num = e_num;
		this.e_money = e_money;
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

	public int getE_money() {
		return e_money;
	}

	public void setE_money(int e_money) {
		this.e_money = e_money;
	}

	public int getE_ea() {
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
