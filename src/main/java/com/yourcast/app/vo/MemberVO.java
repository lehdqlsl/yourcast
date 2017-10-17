package com.yourcast.app.vo;

import java.util.Date;

public class MemberVO {
	private int m_num;
	private String id;
	private String pwd;
	private String name;
	private Date birth;
	private int money;
	private Date limit_date;
	private int star_candy;
	private int gender_num;
	private int grade_num;
	private String grade_name;
	private String gender_name;

	public MemberVO(int m_num, String id, String pwd, String name, Date birth, int money, Date limit_date,
			int star_candy, int gender_num, int grade_num) {
		super();
		this.m_num = m_num;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.money = money;
		this.limit_date = limit_date;
		this.star_candy = star_candy;
		this.gender_num = gender_num;
		this.grade_num = grade_num;
	}
	
	

	public MemberVO(int m_num, String id, String pwd, String name, Date birth, int money, Date limit_date,
			int star_candy, int gender_num, int grade_num, String grade_name, String gender_name) {
		super();
		this.m_num = m_num;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.money = money;
		this.limit_date = limit_date;
		this.star_candy = star_candy;
		this.gender_num = gender_num;
		this.grade_num = grade_num;
		this.grade_name = grade_name;
		this.gender_name = gender_name;
	}



	public String getGender_name() {
		return gender_name;
	}



	public void setGender_name(String gender_name) {
		this.gender_name = gender_name;
	}



	public String getGrade_name() {
		return grade_name;
	}



	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}



	public MemberVO(int m_num, int money, int star_candy) {
		super();
		this.m_num = m_num;
		this.money = money;
		this.star_candy = star_candy;
	}

	public MemberVO(int m_num, int grade_num) {
		super();
		this.m_num = m_num;
		this.grade_num = grade_num;
	}

	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public Date getLimit_date() {
		return limit_date;
	}

	public void setLimit_date(Date limit_date) {
		this.limit_date = limit_date;
	}

	public int getStar_candy() {
		return star_candy;
	}

	public void setStar_candy(int star_candy) {
		this.star_candy = star_candy;
	}

	public int getGender_num() {
		return gender_num;
	}

	public void setGender_num(int gender_num) {
		this.gender_num = gender_num;
	}

	public int getGrade_num() {
		return grade_num;
	}

	public void setGrade_num(int grade_num) {
		this.grade_num = grade_num;
	}

}
