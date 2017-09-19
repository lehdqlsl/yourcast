package com.yourcast.app.vo;

import java.sql.Date;

public class ProfitVO {
	private int profit_num;
	private int profit_ea;
	private Date profit_regdate;
	private int m_num;
	
	public ProfitVO() {}
	
	public ProfitVO(int profit_num, int profit_ea, Date profit_regdate, int m_num) {
		super();
		this.profit_num = profit_num;
		this.profit_ea = profit_ea;
		this.profit_regdate = profit_regdate;
		this.m_num = m_num;
	}
	public int getProfit_num() {
		return profit_num;
	}
	public void setProfit_num(int profit_num) {
		this.profit_num = profit_num;
	}
	public int getProfit_ea() {
		return profit_ea;
	}
	public void setProfit_ea(int profit_ea) {
		this.profit_ea = profit_ea;
	}
	public Date getProfit_regdate() {
		return profit_regdate;
	}
	public void setProfit_regdate(Date profit_regdate) {
		this.profit_regdate = profit_regdate;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	
	
}
