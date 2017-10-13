package com.yourcast.app.vo;

public class VideoReplyVO {
	private int vr_num;
	private String vr_content;
	private String vr_regdate;
	private int vr_delete;
	private int v_num;
	private int m_num;
	private String id;
	private int vrucnt;
	private int v_report;
	private String age_grade_name;
	private String genre_name;
	private String v_savethumbnail;
	private String bj_id;
	private String v_title;
	
	public VideoReplyVO() {}

	public VideoReplyVO(int vr_num, String vr_content, int v_num, String id, int v_report,String age_grade_name,String genre_name,String v_savethumbnail,String bj_id,String v_title) {
		super();
		this.vr_num = vr_num;
		this.vr_content = vr_content;
		this.v_num = v_num;
		this.id = id;
		this.v_report = v_report;
		this.age_grade_name = age_grade_name;
		this.genre_name = genre_name;
		this.v_savethumbnail = v_savethumbnail;
		this.bj_id = bj_id;
		this.v_title = v_title;
	}

	public VideoReplyVO(int vr_num, String vr_content, String vr_regdate, int vr_delete, int v_num, int m_num) {
		//super();
		this.vr_num = vr_num;
		this.vr_content = vr_content;
		this.vr_regdate = vr_regdate;
		this.vr_delete = vr_delete;
		this.v_num = v_num;
		this.m_num = m_num;
	}
	public VideoReplyVO(int vr_num, String vr_content, String vr_regdate, int vr_delete, int v_num, int m_num,String id,int vrucnt) {
		super();
		this.vr_num = vr_num;
		this.vr_content = vr_content;
		this.vr_regdate = vr_regdate;
		this.vr_delete = vr_delete;
		this.v_num = v_num;
		this.m_num = m_num;
		this.id=id;
		this.vrucnt=vrucnt;
	}

	
	public String getV_title() {
		return v_title;
	}

	public void setV_title(String v_title) {
		this.v_title = v_title;
	}

	public String getBj_id() {
		return bj_id;
	}

	public void setBj_id(String bj_id) {
		this.bj_id = bj_id;
	}

	public String getAge_grade_name() {
		return age_grade_name;
	}

	public void setAge_grade_name(String age_grade_name) {
		this.age_grade_name = age_grade_name;
	}

	public String getGenre_name() {
		return genre_name;
	}

	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}

	public String getV_savethumbnail() {
		return v_savethumbnail;
	}

	public void setV_savethumbnail(String v_savethumbnail) {
		this.v_savethumbnail = v_savethumbnail;
	}

	public int getV_report() {
		return v_report;
	}

	public void setV_report(int v_report) {
		this.v_report = v_report;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getVrucnt() {
		return vrucnt;
	}

	public void setVrucnt(int vrucnt) {
		this.vrucnt = vrucnt;
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

	public String getVr_regdate() {
		return vr_regdate;
	}

	public void setVr_regdate(String vr_regdate) {
		this.vr_regdate = vr_regdate;
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
