package com.yourcast.app.vo;

public class CategoryVO {
	private int category_num;
	private String category_name;
	private int category_delete;
	private int m_num;

	public CategoryVO(int category_num, String category_name, int category_delete, int m_num) {
		super();
		this.category_num = category_num;
		this.category_name = category_name;
		this.category_delete = category_delete;
		this.m_num = m_num;
	}

	public CategoryVO() {
		// TODO Auto-generated constructor stub
	}

	public int getCategory_num() {
		return category_num;
	}

	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public int getCategory_delete() {
		return category_delete;
	}

	public void setCategory_delete(int category_delete) {
		this.category_delete = category_delete;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

}
