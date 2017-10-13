package com.yourcast.app.vo;

public class VideoReplyReportVO {

	private int m_num;
	private int vr_num;
	private String id;
	
	public VideoReplyReportVO() {}

	public VideoReplyReportVO(int m_num, int vr_num, String id) {
		super();
		this.m_num = m_num;
		this.vr_num = vr_num;
		this.id = id;
	}

	public VideoReplyReportVO(int m_num, int vr_num) {
		super();
		this.m_num = m_num;
		this.vr_num = vr_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
