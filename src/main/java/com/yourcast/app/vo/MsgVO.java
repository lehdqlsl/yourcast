package com.yourcast.app.vo;

public class MsgVO {

	private int msg_num;
	private String msg_title;
	private String msg_content;
	private String msg_send_date;
	private int msg_view_date;
	private int msg_receive_delete;
	private int msg_send_delete;
	private int m_numS;
	private int m_numR;
	private String id;
	
	public MsgVO() {}

	public MsgVO(int msg_num, String msg_title, String msg_content, String msg_send_date, int msg_view_date,
			int msg_receive_delete, int msg_send_delete, int m_numS, int m_numR) {
		super();
		this.msg_num = msg_num;
		this.msg_title = msg_title;
		this.msg_content = msg_content;
		this.msg_send_date = msg_send_date;
		this.msg_view_date = msg_view_date;
		this.msg_receive_delete = msg_receive_delete;
		this.msg_send_delete = msg_send_delete;
		this.m_numS = m_numS;
		this.m_numR = m_numR;
	}
	public MsgVO(int msg_num, String msg_title, String msg_content, String msg_send_date, int msg_view_date,
			int msg_receive_delete, int msg_send_delete, int m_numS, int m_numR,String id) {
		//super();
		this.msg_num = msg_num;
		this.msg_title = msg_title;
		this.msg_content = msg_content;
		this.msg_send_date = msg_send_date;
		this.msg_view_date = msg_view_date;
		this.msg_receive_delete = msg_receive_delete;
		this.msg_send_delete = msg_send_delete;
		this.m_numS = m_numS;
		this.m_numR = m_numR;
		this.id=id;
	}
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMsg_num() {
		return msg_num;
	}

	public void setMsg_num(int msg_num) {
		this.msg_num = msg_num;
	}

	public String getMsg_title() {
		return msg_title;
	}

	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public String getMsg_send_date() {
		return msg_send_date;
	}

	public void setMsg_send_date(String msg_send_date) {
		this.msg_send_date = msg_send_date;
	}

	public int getMsg_view_date() {
		return msg_view_date;
	}

	public void setMsg_view_date(int msg_view_date) {
		this.msg_view_date = msg_view_date;
	}

	public int getMsg_receive_delete() {
		return msg_receive_delete;
	}

	public void setMsg_receive_delete(int msg_receive_delete) {
		this.msg_receive_delete = msg_receive_delete;
	}

	public int getMsg_send_delete() {
		return msg_send_delete;
	}

	public void setMsg_send_delete(int msg_send_delete) {
		this.msg_send_delete = msg_send_delete;
	}

	public int getM_numS() {
		return m_numS;
	}

	public void setM_numS(int m_numS) {
		this.m_numS = m_numS;
	}

	public int getM_numR() {
		return m_numR;
	}

	public void setM_numR(int m_numR) {
		this.m_numR = m_numR;
	}
}
