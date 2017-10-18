package com.yourcast.app.vo;

public class GradeVO {
	private int grade_num;
	private String grade_name;
	public GradeVO(){
		
	}
	public int getGrade_num() {
		return grade_num;
	}
	public void setGrade_num(int grade_num) {
		this.grade_num = grade_num;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public GradeVO(int grade_num, String grade_name) {
		super();
		this.grade_num = grade_num;
		this.grade_name = grade_name;
	}
	
	
	
}
