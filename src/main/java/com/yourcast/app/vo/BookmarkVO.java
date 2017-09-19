package com.yourcast.app.vo;

public class BookmarkVO {
	private int bm_num;
	private int m_num;
	private int v_num;
	
	public BookmarkVO() {}
	
	public BookmarkVO(int bm_num, int m_num, int v_num) {
		super();
		this.bm_num = bm_num;
		this.m_num = m_num;
		this.v_num = v_num;
	}
	public int getBm_num() {
		return bm_num;
	}
	public void setBm_num(int bm_num) {
		this.bm_num = bm_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getV_num() {
		return v_num;
	}
	public void setV_num(int v_num) {
		this.v_num = v_num;
	}
		
	
}
