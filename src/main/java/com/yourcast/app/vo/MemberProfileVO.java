package com.yourcast.app.vo;

public class MemberProfileVO {
	private int profile_num;
	private String profile_msg;
	private String profile_content;
	private String profile_orgfilename;
	private String profile_savefilename;
	private int m_num;
	public MemberProfileVO(int profile_num, String profile_msg, String profile_content, String profile_orgfilename,
			String profile_savefilename, int m_num) {
		super();
		this.profile_num = profile_num;
		this.profile_msg = profile_msg;
		this.profile_content = profile_content;
		this.profile_orgfilename = profile_orgfilename;
		this.profile_savefilename = profile_savefilename;
		this.m_num = m_num;
	}
	
	public MemberProfileVO() {
		
	}
	public int getProfile_num() {
		return profile_num;
	}
	public void setProfile_num(int profile_num) {
		this.profile_num = profile_num;
	}
	public String getProfile_msg() {
		return profile_msg;
	}
	public void setProfile_msg(String profile_msg) {
		this.profile_msg = profile_msg;
	}
	public String getProfile_content() {
		return profile_content;
	}
	public void setProfile_content(String profile_content) {
		this.profile_content = profile_content;
	}
	public String getProfile_orgfilename() {
		return profile_orgfilename;
	}
	public void setProfile_orgfilename(String profile_orgfilename) {
		this.profile_orgfilename = profile_orgfilename;
	}
	public String getProfile_savefilename() {
		return profile_savefilename;
	}
	public void setProfile_savefilename(String profile_savefilename) {
		this.profile_savefilename = profile_savefilename;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	
}
