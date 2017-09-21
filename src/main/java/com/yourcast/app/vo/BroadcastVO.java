package com.yourcast.app.vo;

public class BroadcastVO {
	private String broadcast_title;
	private String stream_key;
	private int onair;
	private int genre_num;
	private int m_num;
	private int age_grade_num;

	public BroadcastVO(String broadcast_title, String stream_key, int onair, int genre_num, int m_num,
			int age_grade_num) {
		super();
		this.broadcast_title = broadcast_title;
		this.stream_key = stream_key;
		this.onair = onair;
		this.genre_num = genre_num;
		this.m_num = m_num;
		this.age_grade_num = age_grade_num;
	}

	public BroadcastVO() {
		// TODO Auto-generated constructor stub
	}

	public String getBroadcast_title() {
		return broadcast_title;
	}

	public void setBroadcast_title(String broadcast_title) {
		this.broadcast_title = broadcast_title;
	}

	public String getStream_key() {
		return stream_key;
	}

	public void setStream_key(String stream_key) {
		this.stream_key = stream_key;
	}

	public int getOnair() {
		return onair;
	}

	public void setOnair(int onair) {
		this.onair = onair;
	}

	public int getGenre_num() {
		return genre_num;
	}

	public void setGenre_num(int genre_num) {
		this.genre_num = genre_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getAge_grade_num() {
		return age_grade_num;
	}

	public void setAge_grade_num(int age_grade_num) {
		this.age_grade_num = age_grade_num;
	}

}
