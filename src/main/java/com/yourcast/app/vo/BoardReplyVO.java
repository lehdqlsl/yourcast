package com.yourcast.app.vo;


public class BoardReplyVO {
	private int br_num;
	private String br_content;
	private String br_regdate;
	private int br_delete;
	private int b_num;
	private int m_num;
	private String id;
	private int brucnt;
	
	private int brrcnt;
	private int category_num;
	private String category_name;
	private String bj_id;
	private String b_title;
	private String writer_id;

	public BoardReplyVO() {}
	
	public BoardReplyVO(int br_num, String br_content, int brrcnt, String id, int b_num, int category_num, String bj_id,String b_title,String category_name,String writer_id) {
		super();
		this.br_num = br_num;
		this.br_content = br_content;
		this.id = id;
		this.brrcnt = brrcnt;
		this.b_num = b_num;
		this.category_num = category_num;
		this.bj_id = bj_id;
		this.b_title = b_title;
		this.category_name = category_name;
		this.writer_id = writer_id;
	}


	public BoardReplyVO(int br_num, String br_content, String br_regdate, int br_delete, int b_num, int m_num) {
		//super();
		this.br_num = br_num;
		this.br_content = br_content;
		this.br_regdate = br_regdate;
		this.br_delete = br_delete;
		this.b_num = b_num;
		this.m_num = m_num;
	}
	public BoardReplyVO(int br_num, String br_content, String br_regdate, int br_delete, int b_num, int m_num,String id) {
		//super();
		this.br_num = br_num;
		this.br_content = br_content;
		this.br_regdate = br_regdate;
		this.br_delete = br_delete;
		this.b_num = b_num;
		this.m_num = m_num;
		this.id=id;
	}
	public BoardReplyVO(int br_num, String br_content, String br_regdate, int br_delete, int b_num, int m_num,String id,int brucnt) {
		//super();
		this.br_num = br_num;
		this.br_content = br_content;
		this.br_regdate = br_regdate;
		this.br_delete = br_delete;
		this.b_num = b_num;
		this.m_num = m_num;
		this.id=id;
		this.brucnt=brucnt;
	}
	
	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getBj_id() {
		return bj_id;
	}

	public void setBj_id(String bj_id) {
		this.bj_id = bj_id;
	}

	public int getCategory_num() {
		return category_num;
	}

	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}

	public int getBrrcnt() {
		return brrcnt;
	}

	public void setBrrcnt(int brrcnt) {
		this.brrcnt = brrcnt;
	}

	public int getBrucnt() {
		return brucnt;
	}

	public void setBrucnt(int brucnt) {
		this.brucnt = brucnt;
	}

	public int getBr_num() {
		return br_num;
	}

	public void setBr_num(int br_num) {
		this.br_num = br_num;
	}

	public String getBr_content() {
		return br_content;
	}

	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}

	public String getBr_regdate() {
		return br_regdate;
	}

	public void setBr_regdate(String br_regdate) {
		this.br_regdate = br_regdate;
	}

	public int getBr_delete() {
		return br_delete;
	}

	public void setBr_delete(int br_delete) {
		this.br_delete = br_delete;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
}
