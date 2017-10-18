package com.util.page;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatHandler extends TextWebSocketHandler {

	private List<User> list = new ArrayList<User>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(session.getLocalAddress() + " 입장");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParser.parse(message.getPayload().toString());

		int packet = Math.toIntExact((Long) jsonObj.get("packet"));
		Long bj_num;
		String msg;
		switch (packet) {
		case 0: // 채팅 추가
			bj_num = (Long) jsonObj.get("bj_num");
			String id = (String) jsonObj.get("id");
			String name = (String) jsonObj.get("name");
			Long gender = Long.parseLong((String) jsonObj.get("gender"));
			String grade = (String) jsonObj.get("grade");
			list.add(new User(grade, gender, id, name, session, bj_num));
			if(grade.equals("hot")) {
				try {
					bj_num = (Long) jsonObj.get("bj_num");
					msg = (String) jsonObj.get("msg");
					JSONObject obj = new JSONObject();

					obj.put("packet", "0");
					obj.put("id", id);
					obj.put("name", name);
			
					for (User user : list) {
						// 같은 방 찾기
						if (bj_num == user.getBj_num()) {
							user.getSession().sendMessage(new TextMessage(obj.toJSONString()));
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			break;

		case 1: // 채팅 뿌리기
			try {
				bj_num = (Long) jsonObj.get("bj_num");
				msg = (String) jsonObj.get("msg");
				JSONObject obj = new JSONObject();
				for (User user : list) {
					if (session == user.getSession()) {
						obj.put("packet", "1");
						obj.put("id", user.getId());
						obj.put("name", user.getName());
						obj.put("gender", user.getGender());
						obj.put("grade", user.getGrdae());
						obj.put("msg", msg);
						break;
					}
				}
				for (User user : list) {
					// 같은 방 찾기
					if (bj_num == user.getBj_num()) {
						user.getSession().sendMessage(new TextMessage(obj.toJSONString()));
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case 2: // 비로그인 채팅추가
			bj_num = (Long) jsonObj.get("bj_num");
			User user = new User();
			user.setBj_num(bj_num);
			user.setSession(session);
			list.add(user);
			break;

		case 3: // 시청자 수 갱신
			bj_num = (Long) jsonObj.get("bj_num");
			int cnt = 0;
			JSONObject obj = new JSONObject();
			for (User user1 : list) {
				// 같은 방 시청자 찾기
				if (bj_num == user1.getBj_num()) {
					cnt++;
				}
			}
			for (User user1 : list) {
				if (bj_num == user1.getBj_num() && session == user1.getSession()) {
					obj.put("packet", "3");
					obj.put("cnt", cnt);
					user1.getSession().sendMessage(new TextMessage(obj.toJSONString()));
				}
			}
			break;

		//팬가입
		case 4:
			try {
				bj_num = (Long) jsonObj.get("bj_num");
				String cnt1 = (String) jsonObj.get("cnt");
				Long fancnt = (Long) jsonObj.get("fancnt");
				JSONObject obj1 = new JSONObject();
				for (User user2 : list) {
					if (session == user2.getSession()) {
						user2.setGrdae((String) jsonObj.get("grade"));
						obj1.put("packet", "4");
						obj1.put("id", user2.getId());
						obj1.put("name", user2.getName());
						obj1.put("cnt", cnt1);
						obj1.put("fancnt", fancnt);
						break;
					}
				}
				for (User user2 : list) {
					// 같은 방 찾기
					if (bj_num == user2.getBj_num()) {
						user2.getSession().sendMessage(new TextMessage(obj1.toJSONString()));
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		//방송설정변경
		case 5:
			bj_num = (Long) jsonObj.get("bj_num");
			String title = (String) jsonObj.get("title");
			String pwd = (String) jsonObj.get("pwd");
			JSONObject obj1 = new JSONObject();
			obj1.put("packet", "5");
			obj1.put("title", title);
			obj1.put("pwd", pwd);
			for (User user1 : list) {
				// 같은 방 찾기
				if (bj_num == user1.getBj_num()) {
					user1.getSession().sendMessage(new TextMessage(obj1.toJSONString()));
				}
			}
			break;
			
		//강퇴
		case 6:
			bj_num = (Long) jsonObj.get("bj_num");
			id = (String) jsonObj.get("id");
			name = (String) jsonObj.get("name");
			for (User user1 : list) {
				// 같은 방 찾기
				if (bj_num == user1.getBj_num()) {
					if(id.equals(user1.getId())){
						JSONObject obj2 = new JSONObject();
						obj2.put("packet", "6");
						user1.getSession().sendMessage(new TextMessage(obj2.toJSONString()));
					}else {
						JSONObject obj2 = new JSONObject();
						obj2.put("packet", "7");
						obj2.put("id", id);
						obj2.put("name", name);
						user1.getSession().sendMessage(new TextMessage(obj2.toJSONString()));
					}
					
				}
			}
			break;
		default:
			break;
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(session.getLocalAddress() + " 퇴장");
		for (User user : list) {
			if (session == user.getSession()) {
				System.out.println("리스트삭제");
				list.remove(user);
				break;
			}
		}
	}
}
