package com.yourcast.app.vo;

public class VideoVO {
	private int v_num; 
	private String v_title;
	private String v_content;
	private String v_regdate;
	private int v_hit;
	private String v_orgfilename;
	private String v_savefilename;
	private String v_orgthumbnail;
	private String v_savethumbnail;
	private int v_delete;
	private int genre_num; 
	private int age_grade_num;
	private String genre_name;
	private String age_grade_name;
	private int m_num;
	
	public VideoVO() {}

	public VideoVO(int v_num, String v_title, String v_content, String v_regdate, int v_hit, String v_orgfilename,
			String v_savefilename, String v_orgthumbnail, String v_savethumbnail, int v_delete, int genre_num,
			int age_grade_num, String genre_name, String age_grade_name, int m_num) {
		super();
		this.v_num = v_num;
		this.v_title = v_title;
		this.v_content = v_content;
		this.v_regdate = v_regdate;
		this.v_hit = v_hit;
		this.v_orgfilename = v_orgfilename;
		this.v_savefilename = v_savefilename;
		this.v_orgthumbnail = v_orgthumbnail;
		this.v_savethumbnail = v_savethumbnail;
		this.v_delete = v_delete;
		this.genre_num = genre_num;
		this.age_grade_num = age_grade_num;
		this.genre_name = genre_name;
		this.age_grade_name = age_grade_name;
		this.m_num = m_num;
	}
	
	public VideoVO(int v_num, String v_title, String v_content, String v_regdate, int v_hit, String v_orgfilename,
			String v_savefilename, String v_orgthumbnail, String v_savethumbnail, int v_delete, int genre_num,
			int age_grade_num, int m_num) {
		super();
		this.v_num = v_num;
		this.v_title = v_title;
		this.v_content = v_content;
		this.v_regdate = v_regdate;
		this.v_hit = v_hit;
		this.v_orgfilename = v_orgfilename;
		this.v_savefilename = v_savefilename;
		this.v_orgthumbnail = v_orgthumbnail;
		this.v_savethumbnail = v_savethumbnail;
		this.v_delete = v_delete;
		this.genre_num = genre_num;
		this.age_grade_num = age_grade_num;
		this.m_num = m_num;
	}

	public String getGenre_name() {
		return genre_name;
	}

	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}

	public String getAge_grade_name() {
		return age_grade_name;
	}

	public void setAge_grade_name(String age_grade_name) {
		this.age_grade_name = age_grade_name;
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

	public String getV_regdate() {
		return v_regdate;
	}

	public void setV_regdate(String v_regdate) {
		this.v_regdate = v_regdate;
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

	public String getV_orgthumbnail() {
		return v_orgthumbnail;
	}

	public void setV_orgthumbnail(String v_orgthumbnail) {
		this.v_orgthumbnail = v_orgthumbnail;
	}

	public String getV_savethumbnail() {
		return v_savethumbnail;
	}

	public void setV_savethumbnail(String v_savethumbnail) {
		this.v_savethumbnail = v_savethumbnail;
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
