package com.yourcast.app.vo;

public class AgeGradeVO {
	private int age_grade_num;
	private String age_grade_name;
	public AgeGradeVO(){}
	public int getAge_grade_num() {
		return age_grade_num;
	}
	public void setAge_grade_num(int age_grade_num) {
		this.age_grade_num = age_grade_num;
	}
	public String getAge_grade_name() {
		return age_grade_name;
	}
	public void setAge_grade_name(String age_grade_name) {
		this.age_grade_name = age_grade_name;
	}
	public AgeGradeVO(int age_grade_num, String age_grade_name) {
		super();
		this.age_grade_num = age_grade_num;
		this.age_grade_name = age_grade_name;
	}
	
}
