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
			Long grade = (Long) jsonObj.get("grade");
			list.add(new User(grade, gender, id, name, session, bj_num));
			break;

		case 1: // 채팅 뿌리기
			try {
				bj_num = (Long) jsonObj.get("bj_num");
				msg = (String) jsonObj.get("msg");
				JSONObject obj = new JSONObject();
				for(User user : list) {
					if(session == user.getSession()) {
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
		case 2:

			break;
		default:
			break;
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(session.getLocalAddress() + " 퇴장");
		for(User user : list) {
			if(session == user.getSession()) {
				System.out.println("리스트삭제");
				list.remove(user);
				break;
			}
		}
	}
}
