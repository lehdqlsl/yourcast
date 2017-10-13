package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.MsgDAO;
import com.yourcast.app.vo.MsgVO;

@Service
public class MsgService {

	@Autowired private MsgDAO dao;
	public void setDao(MsgDAO dao) {
		this.dao = dao;
	}
	
	public int insert(MsgVO vo) {
		return dao.insert(vo);
	}
	
	public List<MsgVO> getSendList(HashMap<String, Object> map){
		return dao.getSendList(map);
	}
	
	public List<MsgVO> getRecvList(HashMap<String, Object> map){
		return dao.getRecvList(map);
	}
	
	public int viewDate(int msg_num) {
		return dao.viewDate(msg_num);
	}
	
	public int sendDelete(int msg_num) {
		return dao.sendDelete(msg_num);
	}
	
	public int recvDelete(int msg_num) {
		return dao.recvDelete(msg_num);
	}
	
	public int sendCount(int m_nums) {
		return dao.sendCount(m_nums);
	}
	
	public int recvCount(int m_numr) {
		return dao.recvCount(m_numr);
	}
	public MsgVO sendmsg(int msg_num) {
		return dao.sendmsg(msg_num);
	}
	public MsgVO recvmsg(int msg_num) {
		return dao.recvmsg(msg_num);
	}
	
}
