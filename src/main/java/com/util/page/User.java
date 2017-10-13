package com.util.page;

import org.springframework.web.socket.WebSocketSession;

public class User {
	private String grade;

	// 1 남자
	// 2 여자
	private long gender;

	private String id;
	private String name;
	// 세션
	private WebSocketSession session;

	// 방장
	private long bj_num;

	public User(String grade, long gender, String id, String name, WebSocketSession session, long bj_num) {
		super();
		this.grade = grade;
		this.gender = gender;
		this.id = id;
		this.name = name;
		this.session = session;
		this.bj_num = bj_num;
	}
	public User() {
		// TODO Auto-generated constructor stub
	}

	public String getGrdae() {
		return grade;
	}

	public void setGrdae(String grdae) {
		this.grade = grdae;
	}

	public long getGender() {
		return gender;
	}

	public void setGender(long gender) {
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public WebSocketSession getSession() {
		return session;
	}

	public void setSession(WebSocketSession session) {
		this.session = session;
	}

	public long getBj_num() {
		return bj_num;
	}

	public void setBj_num(long bj_num) {
		this.bj_num = bj_num;
	}

}
