package com.yourcast.app.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

@XmlAccessorType(XmlAccessType.FIELD)
public class FanVO {
	private int fan_num;
	private int m_num;
	private int bj_num;
	private String id;
	private String name;
	private int cnt;
	private int rnum;
	
	public FanVO() {}
	
	public FanVO(int fan_num, int m_num, int bj_num) {
		super();
		this.fan_num = fan_num;
		this.m_num = m_num;
		this.bj_num = bj_num;
	}
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public FanVO(int fan_num, int m_num, int bj_num, String id, String name, int cnt, int rnum) {
		super();
		this.fan_num = fan_num;
		this.m_num = m_num;
		this.bj_num = bj_num;
		this.id = id;
		this.name = name;
		this.cnt = cnt;
		this.rnum = rnum;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getFan_num() {
		return fan_num;
	}
	public void setFan_num(int fan_num) {
		this.fan_num = fan_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getBj_num() {
		return bj_num;
	}
	public void setBj_num(int bj_num) {
		this.bj_num = bj_num;
	}
	
}
