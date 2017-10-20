package com.yourcast.app.vo;

public class PayVO {

	private int pay_num;
	private int pay_money;
	private String pay_regdate;
	private int m_num;
	private int p_num;
	private String p_name;
	private String money;
	
	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public PayVO() {}

	public PayVO(int pay_num, int pay_money, String pay_regdate, int m_num, int p_num,String p_name,String money) {
		super();
		this.pay_num = pay_num;
		this.pay_money = pay_money;
		this.pay_regdate = pay_regdate;
		this.m_num = m_num;
		this.p_num = p_num;
		this.p_name = p_name;
		this.money = money;
	}

	public PayVO(int pay_num, int pay_money, String pay_regdate, int m_num, int p_num, String p_name) {
		super();
		this.pay_num = pay_num;
		this.pay_money = pay_money;
		this.pay_regdate = pay_regdate;
		this.m_num = m_num;
		this.p_num = p_num;
		this.p_name = p_name;
	}

	public PayVO(int p_num, String p_name) {
		super();
		this.p_num = p_num;
		this.p_name = p_name;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
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

	public String getPay_regdate() {
		return pay_regdate;
	}

	public void setPay_regdate(String pay_regdate) {
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
