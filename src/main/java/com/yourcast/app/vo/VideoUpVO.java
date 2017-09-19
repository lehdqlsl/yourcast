package com.yourcast.app.vo;

public class VideoUpVO {
	private int m_num;
	private int v_num;

	public VideoUpVO(int m_num, int v_num) {
		super();
		this.m_num = m_num;
		this.v_num = v_num;
	}

	public VideoUpVO() {
		// TODO Auto-generated constructor stub
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
