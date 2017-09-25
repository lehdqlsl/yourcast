package com.yourcast.app.vo;

public class VideoVO {
	private int v_num; 
	private String v_title;
	private String v_content;
	private String v_regString;
	private int v_hit;
	private String v_orgfilename;
	private String v_savefilename;
	private int v_delete;
	private int genre_num; 
	private int age_grade_num;
	private int m_num;
	
	public VideoVO() {}
	
	public VideoVO(int v_num, String v_title, String v_content, String v_regString, int v_hit, String v_orgfilename,
			String v_savefilename, int v_delete, int genre_num, int age_grade_num, int m_num) {
		super();
		this.v_num = v_num;
		this.v_title = v_title;
		this.v_content = v_content;
		this.v_regString = v_regString;
		this.v_hit = v_hit;
		this.v_orgfilename = v_orgfilename;
		this.v_savefilename = v_savefilename;
		this.v_delete = v_delete;
		this.genre_num = genre_num;
		this.age_grade_num = age_grade_num;
		this.m_num = m_num;
	}
	public int getV_num() {
		return v_num;
	}
	public void setV_num(int v_num) {
		this.v_num = v_num;
	}
	public String getV_title() {
		return v_title;
	}
	public void setV_title(String v_title) {
		this.v_title = v_title;
	}
	public String getV_content() {
		return v_content;
	}
	public void setV_content(String v_content) {
		this.v_content = v_content;
	}
	public String getV_regString() {
		return v_regString;
	}
	public void setV_regString(String v_regString) {
		this.v_regString = v_regString;
	}
	public int getV_hit() {
		return v_hit;
	}
	public void setV_hit(int v_hit) {
		this.v_hit = v_hit;
	}
	public String getV_orgfilename() {
		return v_orgfilename;
	}
	public void setV_orgfilename(String v_orgfilename) {
		this.v_orgfilename = v_orgfilename;
	}
	public String getV_savefilename() {
		return v_savefilename;
	}
	public void setV_savefilename(String v_savefilename) {
		this.v_savefilename = v_savefilename;
	}
	public int getV_delete() {
		return v_delete;
	}
	public void setV_delete(int v_delete) {
		this.v_delete = v_delete;
	}
	public int getGenre_num() {
		return genre_num;
	}
	public void setGenre_num(int genre_num) {
		this.genre_num = genre_num;
	}
	public int getAge_grade_num() {
		return age_grade_num;
	}
	public void setAge_grade_num(int age_grade_num) {
		this.age_grade_num = age_grade_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	
	
}
