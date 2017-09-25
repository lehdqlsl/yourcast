package com.yourcast.app.vo;

public class BuyVO {
	private int buy_num;
	private String buy_regString;
	private int buy_ea;
	private int m_num;
	
	public BuyVO() {
		
	}

	public BuyVO(int buy_num, String buy_regString, int buy_ea, int m_num) {
		super();
		this.buy_num = buy_num;
		this.buy_regString = buy_regString;
		this.buy_ea = buy_ea;
		this.m_num = m_num;
	}

	public int getBuy_num() {
		return buy_num;
	}

	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}

	public String getBuy_regString() {
		return buy_regString;
	}

	public void setBuy_regString(String buy_regString) {
		this.buy_regString = buy_regString;
	}

	public int getBuy_ea() {
		return buy_ea;
	}

	public void setBuy_ea(int buy_ea) {
		this.buy_ea = buy_ea;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	
	
}
