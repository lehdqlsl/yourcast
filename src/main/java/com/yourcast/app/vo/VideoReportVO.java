package com.yourcast.app.vo;

public class VideoReportVO {
	private int v_num;
	private int m_num;
	
	public VideoReportVO() {}
	
	public VideoReportVO(int v_num, int m_num) {
		super();
		this.v_num = v_num;
		this.m_num = m_num;
	}
	public int getV_num() {
		return v_num;
	}
	public void setV_num(int v_num) {
		this.v_num = v_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	
	
}
