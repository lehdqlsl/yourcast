package com.yourcast.app.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

@XmlAccessorType(XmlAccessType.FIELD)
public class StarUseVO {

	private int use_num;
	private String use_regdate;
	private int use_ea;
	private int m_num;
	private int bj_num;
	private String id;
	
	public StarUseVO() {}

	public StarUseVO(int use_num, String use_regdate, int use_ea, int m_num, int bj_num) {
		super();
		this.use_num = use_num;
		this.use_regdate = use_regdate;
		this.use_ea = use_ea;
		this.m_num = m_num;
		this.bj_num = bj_num;
	}

	public StarUseVO(int use_num, String use_regdate, int use_ea, int m_num, int bj_num, String id) {
		super();
		this.use_num = use_num;
		this.use_regdate = use_regdate;
		this.use_ea = use_ea;
		this.m_num = m_num;
		this.bj_num = bj_num;
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getUse_num() {
		return use_num;
	}

	public void setUse_num(int use_num) {
		this.use_num = use_num;
	}

	public String getUse_regdate() {
		return use_regdate;
	}

	public void setUse_regdate(String use_regdate) {
		this.use_regdate = use_regdate;
	}

	public int getUse_ea() {
		return use_ea;
	}

	public void setUse_ea(int use_ea) {
		this.use_ea = use_ea;
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
