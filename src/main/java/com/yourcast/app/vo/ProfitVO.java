package com.yourcast.app.vo;

public class ProfitVO {
	private int profit_num;
	private int profit_money;
	private String profit_regString;
	private int m_num;
	
	public ProfitVO() {}
	
	public ProfitVO(int profit_num, int profit_money, String profit_regString, int m_num) {
		super();
		this.profit_num = profit_num;
		this.profit_money = profit_money;
		this.profit_regString = profit_regString;
		this.m_num = m_num;
	}
	public int getProfit_num() {
		return profit_num;
	}
	public void setProfit_num(int profit_num) {
		this.profit_num = profit_num;
	}
	public int getProfit_money() {
		return profit_money;
	}
	public void setProfit_money(int profit_money) {
		this.profit_money = profit_money;
	}
	public String getProfit_regString() {
		return profit_regString;
	}
	public void setProfit_regString(String profit_regString) {
		this.profit_regString = profit_regString;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	
	
}
