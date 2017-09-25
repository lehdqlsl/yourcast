package com.yourcast.app.vo;

public class PayVO {

	private int pay_num;
	private int pay_money;
	private String pay_regString;
	private int m_num;
	private int p_num;
	
	public PayVO() {}

	public PayVO(int pay_num, int pay_money, String pay_regString, int m_num, int p_num) {
		super();
		this.pay_num = pay_num;
		this.pay_money = pay_money;
		this.pay_regString = pay_regString;
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

	public String getPay_regString() {
		return pay_regString;
	}

	public void setPay_regString(String pay_regString) {
		this.pay_regString = pay_regString;
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
