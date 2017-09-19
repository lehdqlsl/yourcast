package com.yourcast.app.vo;

import java.sql.Date;

public class PayVO {

	private int pay_num;
	private int pay_money;
	private Date pay_regdate;
	private int m_num;
	private int p_num;
	
	public PayVO() {}

	public PayVO(int pay_num, int pay_money, Date pay_regdate, int m_num, int p_num) {
		super();
		this.pay_num = pay_num;
		this.pay_money = pay_money;
		this.pay_regdate = pay_regdate;
		this.m_num = m_num;
		this.p_num = p_num;
	}

	public int getPay_num() {
		return pay_num;
	}

	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}

	public int getPay_money() {
		return pay_money;
	}

	public void setPay_money(int pay_money) {
		this.pay_money = pay_money;
	}

	public Date getPay_regdate() {
		return pay_regdate;
	}

	public void setPay_regdate(Date pay_regdate) {
		this.pay_regdate = pay_regdate;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	
	
}
