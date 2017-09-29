package com.util.page;

import java.util.ArrayList;
import java.util.List;

public class ChatRoom {
	private int bj_num;
	private List<User> list = new ArrayList<User>();

	public ChatRoom(int bj_num, List<User> list) {
		super();
		this.bj_num = bj_num;
		this.list = list;
	}
	
	
}
