package com.yourcast.app.vo;

public class VideoReplyVO {
	private int vr_num;
	private String vr_content;
	private String vr_regString;
	private int vr_delete;
	private int v_num;
	private int m_num;
	
	public VideoReplyVO() {
		
	}

	public VideoReplyVO(int vr_num, String vr_content, String vr_regString, int vr_delete, int v_num, int m_num) {
		super();
		this.vr_num = vr_num;
		this.vr_content = vr_content;
		this.vr_regString = vr_regString;
		this.vr_delete = vr_delete;
		this.v_num = v_num;
		this.m_num = m_num;
	}

	public int getVr_num() {
		return vr_num;
	}

	public void setVr_num(int vr_num) {
		this.vr_num = vr_num;
	}

	public String getVr_content() {
		return vr_content;
	}

	public void setVr_content(String vr_content) {
		this.vr_content = vr_content;
	}

	public String getVr_regString() {
		return vr_regString;
	}

	public void setVr_regString(String vr_regString) {
		this.vr_regString = vr_regString;
	}

	public int getVr_delete() {
		return vr_delete;
	}

	public void setVr_delete(int vr_delete) {
		this.vr_delete = vr_delete;
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
