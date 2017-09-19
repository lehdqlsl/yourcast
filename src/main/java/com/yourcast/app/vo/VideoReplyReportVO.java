package com.yourcast.app.vo;

public class VideoReplyReportVO {

	private int m_num;
	private int vr_num;
	
	public VideoReplyReportVO() {}

	public VideoReplyReportVO(int m_num, int vr_num) {
		super();
		this.m_num = m_num;
		this.vr_num = vr_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getVr_num() {
		return vr_num;
	}

	public void setVr_num(int vr_num) {
		this.vr_num = vr_num;
	}
	
	
}
