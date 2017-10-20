package com.yourcast.app.vo;

public class ExchangeVO {
	private int e_num;
	private int e_ea;
	private double e_fee;
	private String e_regdate;
	private int m_num;
	private int e_money;
	private String money;
	private String price;

	public ExchangeVO(int e_num, int e_ea, double e_fee, String e_regdate, int m_num) {
		super();
		this.e_num = e_num;
		this.e_ea = e_ea;
		this.e_fee = e_fee;
		this.e_regdate = e_regdate;
		this.m_num = m_num;
	}

	public int getE_money() {
		return e_money;
	}

	public void setE_money(int e_money) {
		this.e_money = e_money;
	}

	public ExchangeVO(int e_num, int e_ea, double e_fee, String e_regdate, int m_num, int e_money) {
		super();
		this.e_num = e_num;
		this.e_ea = e_ea;
		this.e_fee = e_fee;
		this.e_regdate = e_regdate;
		this.m_num = m_num;
		this.e_money = e_money;
	}

	public ExchangeVO() {
		// TODO Auto-generated constructor stub
	}

	public ExchangeVO(int e_num, int e_ea, double e_fee, String e_regdate, int m_num, int e_money, String money,String price) {
		super();
		this.e_num = e_num;
		this.e_ea = e_ea;
		this.e_fee = e_fee;
		this.e_regdate = e_regdate;
		this.m_num = m_num;
		this.e_money = e_money;
		this.money = money;
		this.price = price;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public int getE_num() {
		return e_num;
	}

	public void setE_num(int e_num) {
		this.e_num = e_num;
	}

	public int getE_ea() {
		return e_ea;
	}

	public void setE_ea(int e_ea) {
		this.e_ea = e_ea;
	}

	public double getE_fee() {
		return e_fee;
	}

	public void setE_fee(double e_fee) {
		this.e_fee = e_fee;
	}

	public String getE_regdate() {
		return e_regdate;
	}

	public void setE_regdate(String e_regdate) {
		this.e_regdate = e_regdate;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
}
