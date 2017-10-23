package com.yourcast.app.vo;

import java.text.DecimalFormat;

public class ProfitVO {
	DecimalFormat df = new DecimalFormat("#,##0");
	private int profit_num;
	private int profit_money;
	private String profit_regdate;
	private int m_num;
	private String id;
	private String grade_name;
	private int rnum;
	private int total;
	private String money;
	private String totalmoney;
	
	private String p_date;
	private int grade_num;
	public ProfitVO() {
		
	}

	
	
	public ProfitVO(int total, String id, String grade_name, int rnum) {
		this.total = total;
		this.id = id;
		this.grade_name = grade_name;
		this.rnum = rnum;
	}

	public ProfitVO(int profit_num, int profit_money, String profit_regdate, int m_num) {
		super();
		this.profit_num = profit_num;
		this.profit_money = profit_money;
		this.profit_regdate = profit_regdate;
		this.m_num = m_num;
	}

	public ProfitVO(int profit_num, int profit_money, String profit_regdate, String id) {
		super();
		this.profit_num = profit_num;
		this.profit_money = profit_money;
		this.profit_regdate = profit_regdate;
		this.id = id;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	}

	public int getGrade_num() {
		return grade_num;
	}



	public void setGrade_num(int grade_num) {
		this.grade_num = grade_num;
	}



	public String getMoney() {
		money = df.format(profit_money) + "¿ø";
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getTotalmoney() {
		totalmoney = df.format(total) + "¿ø";
		return totalmoney;
	}

	public void setTotalmoney(String totalmoney) {
		this.totalmoney = totalmoney;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getGrade_name() {
		return grade_name;
	}

	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getProfit_regdate() {
		return profit_regdate;
	}

	public void setProfit_regdate(String profit_regdate) {
		this.profit_regdate = profit_regdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

}
